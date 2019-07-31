from django.shortcuts import render, redirect


# Create your views here.
from django.views.generic import (
                ListView,
                CreateView,
                DetailView,
                UpdateView,
                DeleteView,
)
from .models import Course, CourseMember, Semester, SkillsTaught
from user.models import User, Student, Skill, Skillset
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from user.decorator import instructor_required, student_required
from django.contrib.auth.mixins import UserPassesTestMixin
from django.db import connection
from .forms import TeachCourseForm, JoinCourseForm, UpdateCourseForm, Search
from django.contrib import messages



@instructor_required
def teach_course(request, year, sem):
    if request.method == 'POST':
        form = TeachCourseForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:

                cursor.execute("SELECT instructor_id \
                                FROM course_coursestaff \
                                WHERE course_id=%s and instructor_id=%s", [form.data['crn'], str(request.user.id)])
                row = cursor.fetchall()
                if(len(row) != 0):
                    messages.warning(request, f'you have added this course')
                    context= {
                        'year': year,
                        'sem': sem,
                    }
                    return render(request, 'course/error.html', context)

                cursor.execute("INSERT INTO course_coursestaff \
                    (course_id, instructor_id) \
                    VALUES (%s,%s)", [form.data['crn'], str(request.user.id)])

            messages.success(request, f'You are teaching this course')
            return redirect('course_detail' ,year,sem, form.data['crn'])
    else:
        form = TeachCourseForm()
    context = {
        'form': form,
        'year': year,
        'sem': sem,
    } 
    return render(request, 'course/course_teach.html', context)   
 



@student_required
def join_course(request, year, sem ):
    if request.method == 'POST':
        form = JoinCourseForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                cursor.execute("SELECT student_id \
                                FROM course_coursemember \
                                WHERE course_id=%s and student_id=%s", [form.data['crn'], str(request.user.id)])
                row = cursor.fetchall()
                if(len(row) != 0):
                    messages.warning(request, f'you have added this course')
                    context= {
                        'year': year,
                        'sem': sem,
                    }
                    return render(request, 'course/error.html', context)
                
                cursor.execute("SELECT max(id) FROM course_coursemember ")
                row = cursor.fetchall()
                try:
                    cursor.execute("INSERT INTO course_coursemember \
                        (id,course_id, student_id) \
                        VALUES (%s,%s,%s)", [row[0][0]+1, form.data['crn'], str(request.user.id)])

                    messages.success(request, f'You are enrolled this course')
                    return redirect('course_detail' ,year,sem, form.data['crn'])
                except:
                    messages.warning(request, f'invalid crn')
                    return redirect('course_join', year, sem)
                

            
    else:
        form = TeachCourseForm()
    context = {
        'form': form,
        'year': year,
        'sem': sem,
    } 
    return render(request, 'course/course_teach.html', context)   


   

# class CourseDetailView(DetailView):
#     model = Course

def course_detail(request, year, sem, crn):
    skillstaught = SkillsTaught.objects.filter(course=crn)

    if request.method == 'GET':
        with connection.cursor() as cursor:
            added_flag = True
            has_instructor_flag = True

            mem_list = []
            cursor.execute("SELECT student_id, netid \
                FROM user_student s JOIN course_coursemember c\
                ON s.user_id = c.student_id\
                WHERE c.course_id=%s", [crn])
            mem = cursor.fetchall()
            if(len(mem) ==0):
                added_flag = False 
            else:
                for item in mem:
                    tu = ()
                    for i in item:
                        tu = tu + (i,)
                    mem_list.append(tu)
                print(mem_list)

            cursor.execute("SELECT crn,course_number, course_title FROM course_course \
                WHERE crn=%s",[crn])
            course = cursor.fetchone()

            cursor.execute("SELECT first_name, last_name \
                FROM course_coursestaff c JOIN user_user i\
                ON c.instructor_id=i.id\
                WHERE c.course_id=%s", [crn])
            instructor = cursor.fetchall()

            stafflist = []
            if(len(instructor)==0):
                has_instructor_flag=False
            else:
                for item in instructor:
                    tu = ()
                    for i in item:
                        tu = tu + (i, )
                    stafflist.append(tu)
                print(stafflist)


            cursor.execute("SELECT name FROM project_project \
                WHERE course_id=%s ORDER BY name", [crn])
            projects = cursor.fetchall()

            cursor.execute("SELECT id FROM project_project \
                WHERE course_id=%s ORDER BY name", [crn])
            project_id = cursor.fetchall()
            pj = zip(projects, project_id)

            member_flag = True
            cursor.execute("SELECT student_id FROM course_coursemember \
                    WHERE course_id=%s and student_id=%s",[crn, str(request.user.id)])
            student = cursor.fetchall()
            if(len(student) == 0):
                member_flag=False
        if added_flag:
            if has_instructor_flag:
                context = {
                        'crn': course[0],
                        'course_number': course[1],
                        'course_title': course[2],
                        'projects': pj,
                        'member_flag': member_flag,
                        'has_instructor': has_instructor_flag,
                        'year': year,
                        'sem': sem,
                        'crn': crn,
                        'members': mem_list,
                        'staff': stafflist,
                        'added_flag':added_flag,
                        'skills': skillstaught,
                    }
                return render(request, 'course/course_detail.html', context)
            else:
                context = {
                            'crn': course[0],
                            'course_number': course[1],
                            'course_title': course[2],
                            'projects': pj,
                            'member_flag': member_flag,
                            'has_instructor': has_instructor_flag,
                            'year': year,
                            'sem': sem,
                            'crn': crn,
                            'members': mem_list,
                            'added_flag':added_flag,
                            'skills': skillstaught,
                        }
                return render(request, 'course/course_detail.html', context)

        else:
            if has_instructor_flag:
                context = {
                    'crn': course[0],
                    'course_number': course[1],
                    'course_title': course[2],
                    'projects': pj,
                    'member_flag': member_flag,
                    'has_instructor': has_instructor_flag,
                    'crn': crn,
                    'added_flag':added_flag,
                    'staff': stafflist,
                    'year': year,
                    'sem': sem,
                    'skills': skillstaught,
                }
                return render(request, 'course/course_detail.html', context)

            else:
                context = {
                    'crn': course[0],
                    'course_number': course[1],
                    'projects': pj,
                    'member_flag': member_flag,
                    'has_instructor': has_instructor_flag,
                    'crn': crn,
                    'added_flag':added_flag,
                    'year': year,
                    'sem': sem,
                    'skills': skillstaught,
                }
                return render(request, 'course/course_detail.html', context)




def course_update(request, year, sem, crn):
    if request.method == 'POST':
        form = UpdateCourseForm(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:

                cursor.execute("UPDATE  course_course SET course_number=%s, course_title=%s", \
                    [form.data['course_number'], form.data['course_title']])

            messages.success(request, f'Course updated')
            return redirect('course_detail' ,year,sem,crn)
    else:
        form = UpdateCourseForm() 
    return render(request, 'course/course_teach.html', {'form':form})   



def course_drop(request, year, sem, crn):
    if(request.user.is_instructor):
        with connection.cursor() as cursor:
            try:
                cursor.execute("DELETE FROM course_coursestaff WHERE instructor_id=%s and course_id=%s", [str(request.user.id), crn])
                messages.success(request, f'dropped the course')
                return redirect('sem_course_home', year, sem)
            except:
                messages.warning(request, f'error')
                return redirect('sem_course_home', year, sem)
    
    else:
        with connection.cursor() as cursor:
            cursor.execute("SELECT student_id FROM course_coursemember \
                WHERE student_id=%s", [str(request.user.id)])
            row = cursor.fetchall()
            if(len(row) == 0):
                messages.warning(request, f"you didnt enroll")
                return redirect('sem_course_home', year, sem)

            cursor.execute("DELETE FROM course_coursemember WHERE student_id=%s and course_id=%s", [str(request.user.id), crn])
            cursor.execute("DELETE FROM stage_feedback WHERE grader_id=%s or receiver_id=%s", [str(request.user.id), str(request.user.id)])
            cursor.execute("DELETE FROM stage_task WHERE student_id=%s", [str(request.user.id)])
            
            cursor.execute("SELECT team_id FROM team_membership WHERE student_id=%s", [str(request.user.id)])
            teams = cursor.fetchall()
            
            #if student is member of any team
            if(len(teams) != 0):
                #update availability regardless

                cursor.execute("UPDATE team_team SET availability=%s \
                    WHERE id in (\
                        SELECT mem.team_id FROM team_membership mem WHERE mem.student_id=%s\
                    )", [True, str(request.user.id)])
                    
                #check if student is captain
                cursor.execute("SELECT team_id FROM team_membership \
                    WHERE student_id=%s and captain_id=%s", [str(request.user.id), str(request.user.id)])
                cteam = cursor.fetchall()
                
                #if student is captain of any team
                if (len(cteam) != 0):
                    
                    cursor.execute("SELECT count(student_id), team_id FROM team_membership\
                                WHERE team_id IN ( \
                                    SELECT team_id FROM team_membership \
                                    WHERE captain_id=%s \
                                )\
                                GROUP BY team_id", [ str(request.user.id)])
                    count = cursor.fetchall()
                    

                    cursor.execute("DELETE FROM team_membership WHERE student_id=%s", [str(request.user.id)])
                    

                    for item in count:
                        #if team is not empty assign someone else as captain
                        if(item[0] > 1):
                            cursor.execute("SELECT student_id FROM team_membership WHERE team_id=%s", [item[1]])
                            newcap = cursor.fetchone()
                            cursor.execute("UPDATE team_membership SET captain_id=%s WHERE team_id=%s", [newcap[0], item[1]])
                            cursor.execute("UPDATE team_team SET captain_id=%s WHERE id=%s", [newcap[0], item[1]])

                        #if team is empty delete team as well
                        else:
                            cursor.execute("DELETE FROM stage_task WHERE team_id=%s", [item[1]])
                            cursor.execute("DELETE FROM team_team WHERE captain_id=%s",[str(request.user.id)])

                cursor.execute("DELETE FROM team_membership WHERE student_id=%s", [str(request.user.id)])
        
            messages.success(request, f'dropped the course')
            return redirect('sem_course_home', year, sem)

       
def sem_course_home(request, year, sem):
    if request.method == 'POST':
        form = Search(request.POST)
        if form.is_valid():
            with connection.cursor() as cursor:
                try:
                    cursor.execute("SELECT id FROM course_semester \
                    WHERE year=%s and semester=%s", [year, sem])
                    semester = cursor.fetchall()
                    courses = Course.objects.filter(semester=semester[0][0],department=form.data['department']).order_by('course_number')
                    context = {
                        'courses': courses,
                        'year': year,
                        'sem': sem,
                        'form':form,
                    }
                    return render(request, 'course/home.html', context)
                except:
                    return redirect('sem_course_home', year,sem)
  
            
    else:
        form = Search()
        with connection.cursor() as cursor:
            cursor.execute("SELECT id FROM course_semester \
                    WHERE year=%s and semester=%s", [year, sem])
            semester = cursor.fetchall()
                
            courses = Course.objects.filter(semester=semester[0][0]).order_by('course_number')
            context = {
                'courses': courses,
                'year': year,
                'sem': sem,
                'form':form,
            }
            return render(request, 'course/home.html', context)


def my_course(request, userid):
    stli = []
    inli = []
    with connection.cursor() as cursor:
        if(request.user.is_student):
            cursor.execute("SELECT c.crn, c.course_number, s.year, s.semester \
                FROM course_course c JOIN course_semester s\
                ON c.semester_id=s.id    \
                WHERE c.crn IN \
                    (SELECT course_id from course_coursemember WHERE student_id = %s)\
                ORDER BY s.year DESC, s.semester, c.course_number", [str(request.user.id)])
            student_courses = cursor.fetchall()

            for course in student_courses:
                tu = ()
                for c in course:
                    tu = tu + (c,)
                stli.append(tu)

            return render(
                request,
                'course/my_course.html',
                context={'list': stli,}
            )

        else:
            cursor.execute("SELECT c.crn, c.course_number, s.year, s.semester \
                FROM course_course c JOIN course_semester s\
                ON c.semester_id=s.id    \
                WHERE c.crn IN \
                    (SELECT course_id from course_coursestaff WHERE instructor_id = %s)\
                ORDER BY s.year DESC, s.semester, c.course_number", [str(request.user.id)])
            instructor_courses = cursor.fetchall()

            for course in instructor_courses:
                tu = ()
                for c in course:
                    tu = tu + (c,)
                inli.append(tu)
            
            return render(
                request,
                'course/my_course.html',
                context={'list': inli,}
            )

def member_profile(request, year, sem, crn, userid):
    student = Student.objects.get(user_id=userid)
    with connection.cursor() as cursor:
        cursor.execute("SELECT skill_name, s2.score FROM user_skill s1\
            JOIN user_skillset s2 ON\
            s1.id = s2.skill_id \
            WHERE s2.student_id = %s AND s2.score != 0", [userid])
        skset = cursor.fetchall()
        li = []
        for item in skset:
            tu = ()
            for i in item:
                tu = tu + (i,)
            li.append(tu)

    context={
        'student': student,
        'skillset':li,
        'year':year,
        'sem':sem,
        'crn':crn,
    }
    return render(request, 'course/member_profile.html', context)


def homepage(request):
    semesters = Semester.objects.all().order_by('-year')
    context = {
        'semesters': semesters,
    }
    return render(request, 'course/homepage.html', context)