from django.shortcuts import render,redirect

# Create your views here.
from django.utils import timezone
from .models import Project

from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from user.decorator import instructor_required
from django.contrib.auth.mixins import UserPassesTestMixin
from .forms import AddProjectForm, ExtendProjectForm, AddSkillRequired
from django.contrib import messages
from django.db import connection
from team.models import Membership
from team.models import Team as T




@instructor_required
def add_project(request, year, sem, crn):
    if request.method == 'POST':
        form = AddProjectForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                cursor.execute("SELECT max(id) FROM project_project ")
                row = cursor.fetchall()

                cursor.execute("INSERT INTO project_project (id,name, durations, stage_num, team_size, course_id, due) \
                    VALUES (%s,%s,%s,%s,%s,%s,%s)", [row[0][0]+1,form.data['name'], form.data['durations'], \
                    form.data['stage_num'], form.data['team_size'],crn, form.data['due'] ] )
                cursor.execute("SELECT max(id) FROM project_project ")
                row = cursor.fetchall()
            messages.success(request, f'project added')
            return redirect('project_detail' ,year, sem,crn, row[0][0])

    else:
        form = AddProjectForm() 
    return render(request, 'project/project_form.html', {'form':form})       


def project_detail(request, year, sem,crn, project_id):
    project = Project.objects.get(id=project_id)
    
    with connection.cursor() as cursor:
        member_flag = True
        team_flag = True

        cursor.execute("SELECT id FROM team_team \
            WHERE course_id=%s and project_id=%s", [crn, project_id])
        teams = cursor.fetchall()
        #there are no teams
        if(len(teams) == 0):
            team_flag = False
        #there are teams
        else:
            teams_obj = T.objects.filter(project_id= project_id)
   
        cursor.execute("SELECT student_id FROM course_coursemember \
                    WHERE course_id=%s and student_id=%s",[crn, str(request.user.id)])
        student = cursor.fetchall()
        if(len(student) == 0):
            member_flag=False

        cursor.execute("SELECT team_id FROM team_membership \
            WHERE student_id=%s and project_id=%s", [str(request.user.id), project_id])
        team = cursor.fetchall()

        skills_list=[]
        cursor.execute("SELECT skill_name FROM project_skillrequired p JOIN\
            user_skill s ON s.id=p.skill_id \
            WHERE project_id=%s", [project_id])
        row = cursor.fetchall()
        for skill in row:
            for s in skill:
                skills_list.append(s)

        if team_flag == False:
            
            if request.user.is_student:
                messages.warning(request,f'havent added team')
        
            context = {
                    'project': project,
                    'name' : project.name,
                    'due_date': project.due,
                    'crn': project.course.crn,
                    'year': year,
                    'sem': sem,
                    'flag': False,
                    'member_flag':member_flag,
                    'team_flag' : team_flag,
                    'skill_list':skills_list,
                    'team_size':project.team_size,
            }
            print('case 1')
            return render(request, 'project/project_detail.html',context)
            

    #have teams but student doesnt have team
    if(len(team) == 0):
        if request.user.is_student:
            messages.warning(request,f'havent added team')
        context = {
            'project': project,
            'name' : project.name,
            'due_date': project.due,
            'crn': project.course.crn,
            'year': year,
            'sem': sem,
            'flag': False,
            'member_flag':member_flag,
            'team_flag' : team_flag,
            'team_list': teams_obj,
            'skill_list':skills_list,
            'team_size':project.team_size,
        }
        print('case 2')
        return render(request, 'project/project_detail.html',context)

    else:
        context = {
            'project': project,
            'name' : project.name,
            'crn': project.course.crn,
            'due_date': project.due,
            'year': year,
            'sem': sem,
            'team_id': team[0][0],
            'flag' : True,
            'member_flag' : member_flag,
            'team_flag' : team_flag,
            'team_list': teams_obj,
            'skill_list':skills_list,
            'team_size':project.team_size,
        }
        print('case 4')
        return render(request, 'project/project_detail.html',context) 
 
  




@instructor_required
def project_update(request, year, sem,crn, project_id):
    if request.method == 'POST':
        form = AddProjectForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:

                cursor.execute("UPDATE project_project SET name=%s, durations=%s, stage_num=%s, due=%s\
                WHERE id=%s",
                    [form.data['name'], form.data['durations'],form.data['stage_num'], form.data['due'],project_id])

            messages.success(request, f'project updated')
            return redirect('project_detail' ,year, sem,crn, project_id)
    else:
        form = AddProjectForm() 
    return render(request, 'project/project_form.html', {'form':form})   




@instructor_required
def project_extension(request, year, sem,crn, project_id):
    if request.method == 'POST':
        form = ExtendProjectForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:

                cursor.execute("UPDATE project_project SET due=%s\
                WHERE id=%s",
                    [form.data['due'],project_id ])

            messages.success(request, f'project updated')
            return redirect('project_detail' , year, sem,crn, project_id)
    else:
        form = ExtendProjectForm() 
    return render(request, 'project/project_form.html', {'form':form}) 




def project_skillrequired(request, year, sem,crn, project_id):
    if request.method == 'POST':
        form = AddSkillRequired(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                
                cursor.execute("SELECT max(id) FROM project_skillrequired ")
                row = cursor.fetchall()

                cursor.execute("INSERT INTO project_skillrequired (id, project_id, skill_id) \
                    VALUES (%s,%s,%s)", [row[0][0]+1, project_id, form.data['skill']])
                
            messages.success(request, f'project required skill added')
            return redirect('project_detail' ,year, sem,crn, project_id)

    else:
        form = AddSkillRequired() 
    return render(request, 'project/project_form.html', {'form':form})       






def match(request, year, sem,crn, project_id):
    #prepare data

    #skills required
    skills_required = []
    with connection.cursor() as cursor:
        cursor.execute("SELECT skill_id FROM project_skillrequired \
            WHERE project_id=%s", [project_id])
        skills = cursor.fetchall()

        for skill in skills:
            for s in skill:
                skills_required.append(s)
        #print(skills_required)

        cursor.execute("SELECT team_size FROM project_project \
            WHERE id=%s", [project_id])
        row = cursor.fetchall()
        team_size = row[0][0]

        cursor.execute("SELECT count(student_id) FROM course_coursemember\
               WHERE course_id=%s",[crn])
        total = cursor.fetchall()
        total_num = total[0][0]
        #print(total_num)
        
        #all students taking this class
        cursor.execute("SELECT student_id FROM course_coursemember\
               WHERE course_id=%s",[crn])
        st_id_list = []
        st_id = cursor.fetchall()
        for item in st_id:
            for i in item:
                st_id_list.append(i)
    
    students_dict = {}
    students = []
    for i in st_id_list:
        students_dict[i] = Student(i)   
        print(i)

    with connection.cursor() as cursor:
        

        for skill_id in skills_required:
            #print(skill_id)
            cursor.execute("SELECT s.student_id, s.skill_id, s.score \
                FROM user_skillset s JOIN course_coursemember c\
                ON s.student_id=c.student_id    \
                WHERE c.course_id=%s and s.skill_id=%s\
                ORDER BY s.score DESC", [crn,skill_id])
            row = cursor.fetchall()
            # print(row)
       
            li = []
            for person in row:
                tu = ()
                for item in person:
                    tu = tu + (item,)
                li.append(tu)

                i = 1    

            for(st, skill, score) in li:
                rank = ((total_num - i)/ total_num )* 100
                students_dict[st].skillset[skill] = rank
                i = i + 1
                
              
           
    #turn dict into set
    for item in students_dict.values():
        print(item.student_id, item.skillset)
        
        students.append(item)
    print('helper')
     
    team_num = (len(students) / team_size) 
    if team_num.is_integer() == False:
        team_num = int(team_num) + 1
    else:
        team_num = int(team_num)

    teams = match_helper(skills_required, students, team_size)
    
    
    dic = {}

    for i in range(team_num):
        dic[i] = []


    for team,student in teams:
        dic[team].append(student)
    print(dic)

    tlist=[]
    for key, item in dic.items():
        li = []
        with connection.cursor() as cursor:
            for i in item:
                cursor.execute("SELECT first_name FROM user_user \
                    WHERE id=%s",[i])
                row = cursor.fetchall()
                li.append(row[0][0])
                
        print(item)
        tu = ()
        tu = tu + (key,)
        tu = tu + (li,)
        tlist.append(tu)
    # for team in teams:
    #     print(team.members)
    context={
        'teams': tlist,
        'year': year,
        'sem':sem,
        'crn': crn,
        'project_id': project_id,
    }
    return render(request, 'project/automatch.html', context)




class Student:
    student_id = 0

    def __init__(self, stid):
        self.student_id = stid
        self.skillset = {}

    
class Team:
    teamid = 0
    skill_num = 1.0
    member_num = 1

    def __init__(self, skill_num, teamid, member_num):
        self.skill_num = skill_num
        self.teamid = teamid
        self.member_num = member_num
        self.members = []
    
    def teamadd(self, s, skill):
        self.skill_num += skill
        if s not in self.members:
            self.members.append(s)
            self.member_num = self.member_num+1
        





def match_helper(skills_required, students, team_size):
    original_length = len(students)

    team_num = (len(students) / team_size) 
    print(original_length)

    if team_num.is_integer() == False:
        team_num = int(team_num) + 1
    else:
        team_num = int(team_num)

    threshold = team_num / len(students) * 100
    
    teams = []
    li = []
    for i in range(team_num):
        t = Team(0, i, 0)
        teams.append(t)

    if len(skills_required) < team_size:
        for skill in skills_required:
            if (len(students) == 0):
                continue
            teams = sorted(teams, key=lambda team: team.skill_num)
            students = sorted(students, key=lambda student: student.skillset.get(skill),reverse=True)

            i = 0
            loopcount = 0
            while( len(students) >0 ):

                if i >= team_num:
                    break
                loopcount+=1

                if(loopcount >= original_length):
                    break

                student = students.pop(0)
 

                # print('student',student.student_id)
                skill_level = student.skillset.get(skill)
                
                if float(skill_level) > threshold:
                    t = teams[i]
                    t.teamadd(student.student_id, skill_level/100)
                    print('student',student.student_id)
                    i = i + 1
                    #print('team', t.teamid, t.members)
                    tu = ()
                    tu = tu + (t.teamid, )
                    tu = tu + (student.student_id, )
                    li.append(tu)
                    
  
                else:
                    students.append(student)
        print('this for loop')

        i = 0
        while len(students) > 0:
            i = (i + 1)%team_num
            t = teams[i]
            student = students.pop()
            # print('team', t.teamid)
            t.teamadd(student.student_id, 0)
            tu = ()
            tu = tu + (t.teamid, )
            tu = tu + (student.student_id, )
            li.append(tu)



        # for i in range(team_num):
                
        #     while (teams[i].member_num) < team_size:
        #         if(len(students) == 0):
        #             break

        #         student = students.pop()
        #         print('student', student.student_id)
        #         t = teams[i]
        #         #print('team', t.teamid)
        #         t.teamadd(student.student_id, 0)
        #         tu = ()
        #         tu = tu + (t.teamid, )
        #         tu = tu + (student.student_id, )
        #         li.append(tu)
    else:
        l = 0
        for skill in skills_required:
            l +=1
            if l == team_size:
                break

            if (len(students) == 0):
                continue
            teams = sorted(teams, key=lambda team: team.skill_num)
            students = sorted(students, key=lambda student: student.skillset.get(skill),reverse=True)

            i = 0
            loopcount = 0
            while( len(students) >0 ):

                if i >= team_num:
                    break
                loopcount+=1

                if(loopcount >= original_length):
                    break

                student = students.pop(0)
 
                # print('student',student.student_id)
                skill_level = student.skillset.get(skill)
                
                if float(skill_level) > threshold*2:
                    t = teams[i]
                    t.teamadd(student.student_id, skill_level/100)
                    print('student',student.student_id)
                    i = i + 1
                    #print('team', t.teamid, t.members)
                    tu = ()
                    tu = tu + (t.teamid, )
                    tu = tu + (student.student_id, )
                    li.append(tu)
                    
  
                else:
                    students.append(student)
        print('this for loop')

        i = 0
        while len(students) > 0:
            i = (i + 1)%team_num
            t = teams[i]
            student = students.pop()
            # print('team', t.teamid)
            t.teamadd(student.student_id, 0)
            tu = ()
            tu = tu + (t.teamid, )
            tu = tu + (student.student_id, )
            li.append(tu)

  
    return li





def match_helper2(skills_required, students, team_size):
    dic = {}
    for s in students:
        dic[s.student_id] = s

    mem = {}
    for s in students:
        mem[s.student_id] = False
    print(mem)
    
    team_num = (len(students) / team_size) 
    if team_num.is_integer() == False:
        team_num = int(team_num) + 1
    else:
        team_num = int(team_num)

    threshold = float(team_num / len(students) * 100)
    
    teams = []
    li = []
    for i in range(team_num):
        t = Team(0, i, 0)
        teams.append(t)

    if len(skills_required) < team_size:
        for skill in skills_required:
            teams = sorted(teams, key=lambda team: team.skill_num)

            i = 0
            j = 0
            while( len(dic) >0 ):

                if i >= team_num:
                    break

                student = students[j]
                j+=1
                print('student',student.student_id)
                skill_level = student.skillset.get(skill)
                
                if float(skill_level) > threshold:
                    key = student.student_id
                    if mem[key] == True:
                        continue
                    	
                    dic.pop(key, None)
                    mem[key] = True
                    t = teams[i]
                    t.teamadd(student.student_id, skill_level/100)
                    
                    i = i + 1
                    # print('team', t.teamid, t.members)
                    tu = ()
                    tu = tu + (t.teamid, )
                    tu = tu + (student.student_id, )
                    li.append(tu)
                    
  
        print('this for loop')

        i = 0
        j = 0
        while len(dic) > 0:
            
            t = teams[i]
            student = students[j]
            j +=1
            # print('team', t.teamid)
            key = student.student_id
            if mem[key] == True:
                continue
            t.teamadd(key, 0)
            dic.pop(key, None)
            mem[key] = True
            i = (i + 1)%team_num

            tu = ()
            tu = tu + (t.teamid, )
            tu = tu + (student.student_id, )
            li.append(tu)
    
    return li


#only need skills from project required skills
# skill 1  rank
# skill 2 rank
# for skill in skill required:
#       get all students's skill who take that course order by score
# 
# student 1 skill1 100
# student 2 skill1 50
# ...
# rank = index / num * 100
# student = students.get(id)
# student.skillset[skill] = rank     
#
