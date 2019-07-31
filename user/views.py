from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import (StudentRegisterForm, InstructorRegisterForm, 
UserUpdateForm, StudentProfileUpdateForm, InstructorProfileUpdateForm)

from django.contrib.messages.views import SuccessMessageMixin
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from user.decorator import student_required, instructor_required
from django.contrib.auth.mixins import UserPassesTestMixin
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth import authenticate, login

from django.views.generic import (
                ListView,
                CreateView,
                DetailView,
                UpdateView,
                DeleteView
)
from django.db import connection
from .models import Skill, Skillset
from django.views.generic import TemplateView

from .forms import  AddSkillForm, UpdateSkillSet

# Create your views here.

class SignUpView(TemplateView):
    template_name = 'user/home.html'


def student_register(request):
    if request.method == 'POST':
        form = StudentRegisterForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                username = form.cleaned_data.get('username')
                with connection.cursor() as cursor:
                    skill_list = []
                    cursor.execute("SELECT id FROM user_skill")
                    skills = cursor.fetchall()
                    for skill in skills:
                        for s in skill:
                            skill_list.append(s)
                    print(skill_list)
                    cursor.execute("SELECT max(user_id) FROM user_student ")
                    newid = cursor.fetchall()
                    for item in skill_list:
                        #print(item)
                        cursor.execute("SELECT max(id) FROM user_skillset")
                        row = cursor.fetchall()

                        cursor.execute("INSERT INTO user_skillset (id, score, skill_id, student_id) \
                            VALUES(%s,%s,%s,%s) ", [row[0][0]+1, 0, item, newid[0][0]])

                messages.success(request, f'Your account has been created! You are now able to login')
                return redirect('login')

            except:
                with connection.cursor() as cursor:
                    cursor.execute("SELECT max(user_id) FROM user_student ")
                    newid = cursor.fetchall()
                    cursor.execute("DELETE FROM user_student WHERE user_id=%s",[newid[0][0]])
                    cursor.execute("SELECT max(id) FROM user_user ")
                    newid = cursor.fetchall()
                    cursor.execute("DELETE FROM user_user WHERE id=%s",[newid[0][0]])
                messages.warning(request,f'invalid input')
                return redirect('student_register')
            
        else:
            messages.warning(request,f'invalid input')
            return redirect('student_register')
    else:
        form = StudentRegisterForm()
    return render(request, 'user/student_register.html', {'form': form})


def instructor_register(request):
    if request.method == 'POST':
        form = InstructorRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Your account has been created! You are now able to login')
            return redirect('login')
    else:
        form = InstructorRegisterForm()
    return render(request, 'user/instructor_register.html', {'form': form})



def dashboard(request):
    return render(request, 'user/dashboard.html', {})


@login_required
def student_profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = StudentProfileUpdateForm(request.POST, 
                                    instance=request.user.student)
        

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('student_profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = StudentProfileUpdateForm(instance=request.user.student)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }
    return render(request, 'user/student_profile.html', context)




@login_required
def instructor_profile(request):
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = InstructorProfileUpdateForm(request.POST, 
                                    instance=request.user.instructor)
        

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('instructor_profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = InstructorProfileUpdateForm(instance=request.user.instructor)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }

    return render(request, 'user/instructor_profile.html',context)




@instructor_required
def add_skill_lib(request):
    skills = Skill.objects.all().order_by('skill_name')
    li = []

    with connection.cursor() as cursor:
        cursor.execute("SELECT id, skill_name FROM user_skill ")

        sk = cursor.fetchall()
        for skill in sk:
            tu = ()
            for s in skill:
                tu = tu + (s,)
            li.append(tu)

    if request.method == 'POST':
        form = AddSkillForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM user_skill\
                    WHERE skill_name=%s", [form.data['skill']])
                row = cursor.fetchall()
                if(len(row) != 0):
                    messages.warning(request, f'skill exists')
                    return redirect('add_skill_lib')
                
                cursor.execute("SELECT max(id) FROM user_skill")
                row = cursor.fetchall()

                cursor.execute("INSERT INTO user_skill (id, skill_name)\
                    VALUES (%s, %s)", [row[0][0]+1, form.data['skill']])
                messages.success(request, f'skill added')
                return redirect('add_skill_lib')
    else:
        form = AddSkillForm()
    context={
        'form':form,
        'skills':skills,
        'list': li,
    }
    return render(request, 'user/add_skill.html', context )


@student_required
def update_skill_score(request):
    skills = Skill.objects.all().order_by('skill_name')
    li = []

    with connection.cursor() as cursor:
        cursor.execute("SELECT skill_name, s1.id, s2.score FROM user_skill s1\
                    JOIN user_skillset s2 ON\
                    s1.id = s2.skill_id \
                    WHERE s2.student_id = %s", [str(request.user.id)])
        skset = cursor.fetchall()
        for skill in skset:
            tu = ()
            for s in skill:
                tu = tu + (s,)
            li.append(tu)

    if request.method == 'POST':
        form = UpdateSkillSet(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                
                cursor.execute("SELECT skill_id FROM user_skillset\
                    WHERE skill_id=%s and student_id=%s", [form.data['skill'],str(request.user.id)])
                row = cursor.fetchall()

                if(len(row)==0):
                    cursor.execute("SELECT max(id) FROM user_skillset")
                    row = cursor.fetchall()

                    cursor.execute("INSERT INTO user_skillset (id, score,skill_id,student_id)\
                        VALUES(%s,%s,%s,%s)",[row[0][0]+1,form.data['score'],form.data['skill'],str(request.user.id)])
                    messages.success(request, f'added skill score')
                    return redirect('update_skill_score')

                else:
                    cursor.execute("UPDATE user_skillset SET score=%s\
                    WHERE skill_id=%s and student_id=%s", [form.data['score'],row[0][0], str(request.user.id) ])
                messages.success(request, f'updated skill score')
                return redirect('update_skill_score')
        
    else:
        form = UpdateSkillSet()
    context={
        'form':form,
        'skills':skills,
        'list': li,
    }
    return render(request, 'user/add_skill.html',context)


@instructor_required
def delete_skill_lib(request, skill_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM user_skillset\
            WHERE skill_id=%s", [skill_id])

        cursor.execute("DELETE FROM user_skill \
            WHERE id=%s",[skill_id])
        messages.success(request, f'skill deleted')
        return redirect('add_skill_lib')


def delete_skill(request, skill_id):
    with connection.cursor() as cursor:
        cursor.execute("UPDATE user_skillset SET score=%s\
            WHERE student_id=%s and skill_id=%s",[0,str(request.user.id),skill_id])
        messages.success(request, f'skill deleted')
        return redirect('update_skill_score')



@user_passes_test(lambda u: u.is_superuser)
def update_system_skill_score(request):
    #update all user's score based on the courses they take for current semester
    with connection.cursor() as cursor:
        cursor.execute("SELECT DISTINCT student_id FROM course_coursemember \
            WHERE course_id IN (\
                SELECT crn FROM course_course\
                WHERE semester_id=%s)",[38])
        
        st = cursor.fetchall()
        # print(st)
        student = []
        score1 = 0
        scores = []
        for item in st:
            for i in item:
                student.append(i)
        # print(student)

        for item in student:
            cursor.execute("SELECT mem.course_id, c.level FROM course_coursemember mem\
                JOIN course_course c\
                ON mem.course_id = c.crn\
                WHERE mem.course_id IN (\
                    SELECT crn FROM course_course\
                WHERE semester_id=%s) AND student_id=%s", [38,item])

            row = cursor.fetchall()
            #print(row)
            student_id = item
            print(student_id)
            #get list of skill of this course
            #update each skill with score += course.level*10
            for courseinfo in row:
                cursor.execute("SELECT t.grade FROM team_team t JOIN \
                    team_membership m \
                    ON t.id=m.team_id \
                    WHERE m.course_id=%s AND m.student_id=%s", [courseinfo[0], student_id])


                project_scores = cursor.fetchall()

                cursor.execute("SELECT count(t.id) FROM team_team t JOIN \
                    team_membership m \
                    ON t.id=m.team_id \
                    WHERE m.course_id=%s AND m.student_id=%s", [courseinfo[0],student_id])
                total_num = cursor.fetchall()

                s = 0
                for score in project_scores:
                    s += score[0]
                if(total_num[0][0] != 0):
                    avg = (s/total_num[0][0] )/10
                else:
                    avg = 0
                

                cursor.execute("SELECT skill_id FROM course_skillstaught \
                    WHERE course_id=%s", [courseinfo[0]])
                sk = cursor.fetchall()

                for s in sk:

                    cursor.execute("SELECT score FROM user_skillset \
                        WHERE student_id=%s and skill_id=%s", [student_id, s[0]])
                    original_score = cursor.fetchall()

                    new_score = original_score[0][0] + courseinfo[1] * 10 + avg*5
                    cursor.execute("UPDATE user_skillset SET score=%s\
                        WHERE student_id=%s and skill_id=%s", [new_score, student_id, s[0]])
        messages.success(request, f'user skill updated in system for current semester')
        return redirect('homepage')


# django-env.cnqngam7cm.us-west-2.elasticbeanstalk.com.


