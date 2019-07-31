from django.shortcuts import render, redirect
from django.db import connection
from django.contrib import messages

from .forms import FeedbackForm, AddTaskForm

from user.models import User
from user.decorator import instructor_required
from .models import Task, Feedback
import datetime

# Create your views here.



def project_plan(request,year, sem,  crn, project_id, team_id):
    #use cursor to select task order by stage
    task = Task.objects.filter(team=team_id)
    context = {
        'task': task,
        'team': team_id,
        'crn': crn,
        'year': year,
        'sem': sem,
        'project_id': project_id,
        'team_id': team_id,
        

    }
    return render(request, 'stage/project_plan.html',context)


def give_feedback(request, year, sem, crn, project_id, team_id, stage_id):
    with connection.cursor() as cursor:
        cursor.execute("SELECT DISTINCT  first_name, student.id\
            FROM team_membership mem JOIN user_user student\
            ON student.id=mem.student_id\
            WHERE team_id=%s\
            ORDER BY student.id", [team_id])
        members = cursor.fetchall()
        li = []
        for member in members:  
            tu = ()
            for m in member: 
                tu = tu + (m,)
            li.append(tu)
        
    if request.method == 'POST':

        form = FeedbackForm(request.POST)
        
        if form.is_valid():
            with connection.cursor() as cursor:
                cursor.execute("SELECT s.id FROM team_membership m\
                    JOIN user_user s ON m.student_id=s.id\
                    WHERE s.first_name=%s",[form.data['receiver']]) 
                row = cursor.fetchall()
                if(len(row) == 0):
                    messages.warning(request, f'enter invalid first name')
                    return redirect('give_feedback', year,sem,crn, project_id, team_id, stage_id)
                    
                       
                cursor.execute("SELECT * FROM stage_feedback \
                    WHERE team_id=%s and stage=%s and grader_id=%s and receiver_id=%s", \
                    [team_id, stage_id, str(request.user.id), row[0][0] ])  
                fb = cursor.fetchall()
                if(len(fb) != 0 ):
                    messages.warning(request, f'already gave feedback to this team member')
                    return redirect('give_feedback', year,sem,crn, project_id, team_id, stage_id)

                try:

                    cursor.execute("INSERT INTO stage_feedback (team_id, stage, grader_id, receiver_id, feedback, rate, date_rated)\
                        VALUES (%s,%s, %s,%s,%s,%s,%s)", [team_id, stage_id, str(request.user.id), row[0][0],\
                    form.data['feedback'], form.data['rate'], str(datetime.date.today()) ])
                except:
                    messages.warning(request, f'error')
                    return redirect('give_feedback', year,sem,crn, project_id, team_id, stage_id)
                
                
            messages.success(request, f'feedback submitted')
        return redirect('team_detail', year,sem,crn, project_id, team_id)
    else:
        form = FeedbackForm()
    return render(request, 'stage/give_feedback.html', {'form': form, 'list':li})


def add_task(request, year, sem, crn, project_id, team_id, stage_id):
    if request.method == 'POST':
        form = AddTaskForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:            
                #allow user to add multiple goals for a stage
                # cursor.execute("SELECT * FROM stage_task \
                #         WHERE stage=%s and student_id=%s and team_id=%s",[stage_id, str(request.user.id), team_id])
                # st = cursor.fetchall()
                # if(len(st)!= 0):
                #     messages.warning(request, f'already added goal for this stage')
                #     return redirect('project_plan', crn, project_id, team_id)

                try:

                    cursor.execute("INSERT INTO stage_task(title, stage, goal, student_id, team_id, status,schedule)\
                            VALUES (%s, %s,%s,%s,%s,%s,%s)", [form.data['title'],stage_id, form.data['description'], \
                        str(request.user.id), team_id, form.data['status'], form.data['schedule']])
                except:
                    messages.warning(request, f'error')
                    return redirect('add_task', year, sem,crn, project_id, team_id, stage_id)
                
                
            messages.success(request, f'Task added')
            return redirect('project_plan', year,sem,crn, project_id, team_id)
    else:
        form = AddTaskForm()
    return render(request, 'stage/add_task.html', {'form': form})



def task_update(request,year, sem, crn, project_id, team_id, stage_id, task_id):
    if request.method == 'POST':
        form = AddTaskForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                cursor.execute("UPDATE stage_task SET title=%s, goal=%s, status=%s, schedule=%s WHERE id=%s ",
                    [form.data['title'], form.data['description'], form.data['status'], form.data['schedule'], task_id])

            messages.success(request, f'task updated')
            return redirect('project_plan' ,year,sem, crn, project_id, team_id)
    else:
        form = AddTaskForm() 
    
    return render(request, 'stage/add_task.html', {'form': form}) 


def task_detail(request, year, sem, crn, project_id, team_id, stage_id, task_id):
    task = Task.objects.get(id=task_id)

    with connection.cursor() as cursor:
        cursor.execute("SELECT title, goal, status, schedule FROM stage_task\
            WHERE team_id=%s and stage=%s and student_id=%s and id=%s",\
                [team_id, stage_id, str(request.user.id), task_id])
        task = cursor.fetchall()
        
        if(len(task) == 0):
            context = {
                'crn':crn,
                'year': year,
                'sem': sem,
                'project_id': project_id,
                'team_id':team_id,
                'stage_id': stage_id,
                'task_id': task_id,
            }
            return render(request, 'stage/task_detail.html', context)
        
    context = {
        'crn':crn,
        'year': year,
        'sem': sem,
        'project_id': project_id,
        'team_id':team_id,
        'stage_id': stage_id,
        'task_id': task_id,
        'task': task,
    }
    return render(request, 'stage/task_detail.html', context)



def mark_completed(request, year, sem, crn, project_id, team_id, stage_id, task_id):
   
    with connection.cursor() as cursor:

        cursor.execute("UPDATE stage_task SET status=%s\
            WHERE team_id=%s and stage=%s and id=%s ", \
            [ 'Done', team_id, stage_id, task_id])

        messages.success(request, f'task completed ')
        return redirect('task_detail' ,year,sem,crn, project_id, team_id, stage_id, task_id)



def delete_task(request, year, sem, crn, project_id, team_id, stage_id, task_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM stage_task WHERE id=%s", [task_id])
        messages.success(request, f'task deleted')
        return redirect('project_plan', year, sem, crn, project_id, team_id )



@instructor_required
def feedback_list(request, year, sem, crn, project_id, team_id, stage_id):
    feedbacks = Feedback.objects.filter(team_id=team_id, stage=stage_id)
    context = {
        'crn':crn,
        'year': year,
        'sem': sem,
        'project_id': project_id,
        'team_id': team_id,
        'stage_id': stage_id,
        'feedbacks': feedbacks,
    }
    return render(request, 'stage/feedback_list.html', context)


@instructor_required
def view_feedback(request, year, sem, crn, project_id, team_id, stage_id, feedback_id):
    feedback = Feedback.objects.get(id=feedback_id)
    context = {
        'feedback': feedback,
    }
    return render(request, 'stage/feedback_detail.html', context)