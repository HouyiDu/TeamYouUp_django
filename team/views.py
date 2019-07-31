from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from user.decorator import student_required, instructor_required
from django.contrib.auth.mixins import UserPassesTestMixin

from django.db import connection
from .models import Team, Membership
from user.models import Skill, Skillset

from .forms import AddTeamForm, JoinTeamForm, GradeForm
from user.forms import AddSkillForm, UpdateSkillSet
from stage.models import Task, Feedback
# Create your views here.


@login_required
def add_team(request, year, sem, crn, project_id):
    if request.method == 'POST':
        form = AddTeamForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                #check if student joined the course
                cursor.execute("SELECT student_id FROM course_coursemember \
                    WHERE course_id=%s and student_id=%s",[crn, str(request.user.id)])
                student = cursor.fetchall()
                if(len(student) == 0):
                    messages.warning(request, f"you haven't joined the course")
                    return redirect('sem_course_home', year, sem)

                cursor.execute("SELECT team_size FROM project_project WHERE id=%s", [project_id] )
                size = cursor.fetchall()

                try:
                    cursor.execute("SELECT max(id) FROM team_team")
                    row = cursor.fetchall()

                    cursor.execute("INSERT INTO team_team (project_id, course_id, name, size, availability, captain_id, grade) \
                                            VALUES (%s,%s,%s,%s,%s,%s,%s)", [project_id, crn, form.data['name'], size[0][0],
                                            True, str(request.user.id),0] )
                                        
                    cursor.execute("SELECT id FROM team_team \
                                                    WHERE project_id=%s and captain_id=%s", [project_id, str(request.user.id)])
                    team = cursor.fetchall()

                    cursor.execute("SELECT max(id) FROM team_membership")
                    row = cursor.fetchall()
                    cursor.execute("INSERT INTO team_membership (id, student_id, team_id, captain_id, project_id, course_id)\
                                        VALUES (%s,%s,%s,%s,%s,%s)", [row[0][0]+1,str(request.user.id), team[0], str(request.user.id), project_id, crn])
                                
                                
                    cursor.execute("SELECT team_size FROM project_project WHERE id=%s", [project_id])
                    size = cursor.fetchone()

                    cursor.execute("SELECT max(id) FROM team_team")
                    teamid = cursor.fetchone()

                    cursor.execute("SELECT count(student_id) FROM team_membership\
                                            WHERE team_id =%s \
                                            GROUP BY team_id", [teamid[0]])
                    count = cursor.fetchone()
                    if (count[0] == size[0]):
                        cursor.execute("UPDATE team_team SET availability=%s \
                                            WHERE id=%s", [False, teamid[0]])

                except:
                    messages.warning(request, f'you already created a team')
                    return redirect('project_detail', year, sem, crn, project_id)
                
            messages.success(request, f'team added')
            return redirect('team_detail' ,year,sem,crn, project_id, team[0][0])

    else:
        form = AddTeamForm() 
    return render(request, 'team/team_form.html', {'form':form})       



@student_required
def join_team(request, year, sem, crn, project_id):
    li = []
    with connection.cursor() as cursor:
        cursor.execute("SELECT id, name FROM team_team \
                    WHERE project_id=%s and course_id=%s", [project_id, crn])
        teams = cursor.fetchall()
                
        for team in teams:
            tu = ()
            for t in team:
                tu = tu + (t,)
            li.append(tu)

    if request.method == 'POST':
        form = JoinTeamForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                try:
                    cursor.execute("SELECT * FROM team_team \
                        WHERE id=%s and project_id=%s and course_id=%s",[form.data['team'], project_id, crn])
                    row = cursor.fetchall()
                    if( len(row) == 0):
                        messages.warning(request, f'this is not a team for this project')
                        return redirect('project_detail', year, sem, crn,project_id)
                    
                    cursor.execute("SELECT availability FROM team_team \
                        WHERE id=%s ", [form.data['team']])
                    a = cursor.fetchone()
                    if(len(a) == 0):
                        messages.warning(request,f'error!!')
                        return redirect('sem_course_home', year, sem)

                    if( a[0] == False):
                        messages.warning(request, f'team is full')
                        return redirect('project_detail', year, sem, crn, project_id)
                
                except:
                    messages.warning(request, f'invalid input')
                    return redirect('project_detail', year, sem, crn, project_id)

                try:
                    cursor.execute("SELECT captain_id FROM team_team WHERE id=%s", [form.data['team']])
                    captain = cursor.fetchone()

                    cursor.execute("SELECT max(id) FROM team_membership")
                    row = cursor.fetchall()

                    cursor.execute("INSERT INTO team_membership (id, student_id, team_id, captain_id, project_id, course_id)\
                                VALUES (%s, %s,%s,%s,%s,%s)", [row[0][0]+1, str(request.user.id), form.data['team'], captain[0], project_id, crn])

                    cursor.execute("SELECT team_size FROM project_project WHERE id=%s", [project_id])
                    size = cursor.fetchone()

                    cursor.execute("SELECT count(student_id) FROM team_membership\
                                    WHERE team_id =%s \
                                    GROUP BY team_id", [form.data['team']])
                    count = cursor.fetchone()
                   
                    if (count[0] >= size[0]):
                        cursor.execute("UPDATE team_team SET availability=%s WHERE id=%s", [False, form.data['team']])
                except:
                    messages.warning(request, f'you already joined a team')
                    return redirect('project_detail' ,year, sem, crn, project_id)
                
            messages.success(request, f'team joined')
            return redirect('team_detail' ,year, sem, crn, project_id, form.data['team'])

    else:
        form = JoinTeamForm() 
    
    context = {
        'form':form,
        'year':year,
        'sem':sem,
        'crn':crn,
        'project_id':project_id,
        'list':li,
    }
    return render(request, 'team/team_join.html', context)  



@student_required
def leave_team(request, year, sem, crn, project_id, team_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT student_id FROM team_membership \
            WHERE student_id=%s", [str(request.user.id)])
        row = cursor.fetchall()
        if(len(row) == 0):
            messages.warning(request, f"you are not a team member ")
            return redirect('project_detail', year, sem, crn, project_id)

        cursor.execute("DELETE FROM stage_task WHERE student_id=%s", [str(request.user.id)])
        cursor.execute("DELETE FROM stage_feedback WHERE grader_id=%s or receiver_id=%s", [str(request.user.id),str(request.user.id)])
        cursor.execute("DELETE FROM team_membership WHERE student_id=%s and team_id=%s", [str(request.user.id), team_id])
        
        #update availability
        cursor.execute("UPDATE team_team SET availability=%s WHERE id=%s", [True, team_id])
                
        #check if student is captain
        cursor.execute("SELECT captain_id FROM team_team WHERE id=%s", [team_id])
        captain = cursor.fetchone()
        
        if(captain[0] == (request.user.id)):
            cursor.execute("SELECT count(student_id) FROM team_membership\
                                WHERE team_id =%s \
                                GROUP BY team_id", [team_id])
            count = cursor.fetchall()
            #if team is not empty make someone else captain
            if(len(count)!=0):
                cursor.execute("SELECT student_id FROM team_membership WHERE team_id=%s ", [team_id])
                cap = cursor.fetchone()
                
                cursor.execute("UPDATE team_membership SET captain_id=%s WHERE team_id=%s",[cap[0],team_id])
                cursor.execute("UPDATE team_team SET captain_id=%s WHERE id=%s",[cap[0],team_id])
            
            else:
                cursor.execute("DELETE FROM stage_task WHERE team_id=%s", [team_id])
                cursor.execute("DELETE FROM team_team WHERE id=%s", [team_id])

    messages.success(request, f'you have left this team')
    return redirect('project_detail', year, sem, crn, project_id)

   

def team_view(request, year, sem, crn, project_id, team_id):
    li = []
    thisteam = Team.objects.get(id=team_id)
    feedbacks = Feedback.objects.filter(team=team_id)
    with connection.cursor() as cursor:
        cursor.execute("SELECT first_name, last_name FROM user_user WHERE id IN \
            (SELECT student_id from team_membership WHERE team_id = %s) ",[team_id])
        row = cursor.fetchall()

        cursor.execute("SELECT stage_num FROM project_project \
            WHERE id=%s",[project_id])
        stage_num = cursor.fetchone()

        cursor.execute("SELECT stage, id FROM stage_task \
            WHERE team_id=%s", [ team_id])
        
        task_flag = True
        tasks = cursor.fetchall()

        cursor.execute("SELECT count(id) FROM stage_task\
            WHERE team_id=%s\
            GROUP BY stage", [team_id])
        total = cursor.fetchall()

        
        cursor.execute("SELECT count(t.id) \
            from stage_task t1 \
            LEFT JOIN (select * from stage_task sub where sub.status=%s)as t\
            on t1.id=t.id\
            where t1.team_id=%s\
            GROUP by t1.stage", ['Done',team_id])

        complete = cursor.fetchall()
        complete_flag= True
             
        li1 = []
        li2 = []
        li =[]     
    
        for tot in total:
            for t in tot:
                li1.append(t)
        for com in complete:
            for c in com:
                li2.append(c)
        
        for i in range(len(li1)):
            tup = ()
            pertencage = li2[i]/li1[i] * 100
            pertencage= '%.2f' % pertencage
            tup = tup + (pertencage,)
            tup = tup + (i,)
            li.append(tup)

        if request.user.is_instructor:
            context={
                'student' : row,
                'crn': crn,
                'year': year,
                'sem': sem,
                'project_id': project_id,
                'team_id': team_id,
                'range': range(stage_num[0]),
                'task_flag': task_flag,     
                'percentage':li,
                'team':thisteam,
                'feedback': feedbacks,
                
            }
            return render(request, 'team/team_detail.html', context)
        
        if(len(tasks) == 0 ):
            task_flag = False
            context={
                'student' : row,
                'crn': crn,
                'year': year,
                'sem': sem,
                'project_id': project_id,
                'team_id': team_id,
                'range': range(stage_num[0]),
                'task_flag': task_flag,     
                'team':thisteam,
                'feedback': feedbacks,
                
            }
            return render(request, 'team/team_detail.html', context)
            
        
        t = Task.objects.filter(team=team_id, student=request.user.id)

        context={
                'student' : row,
                'crn': crn,
                'year': year,
                'sem': sem,
                'project_id': project_id,
                'team_id': team_id,
                'range': range(stage_num[0]),
                'task_flag': task_flag,
                'tasks': t,
                'percentage': li,
                'team':thisteam,
                'feedback': feedbacks,
            }
        return render(
            request,
            'team/team_detail.html',
            context
        )



def grade(request, year, sem, crn, project_id, team_id):
    if request.method == 'POST':
        form = GradeForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                try:
                    cursor.execute("UPDATE team_team SET grade=%s WHERE id=%s",[form.data['grade'],team_id])
                    messages.success(request, f'grade added')
                    return redirect('team_detail' ,year,sem,crn, project_id, team_id)

                except:
                    messages.warning(request, f'invalid input')
                    return redirect('grade', year, sem, crn, project_id, team_id)

    else:
        form = GradeForm() 
    return render(request, 'team/grade.html', {'form':form})   