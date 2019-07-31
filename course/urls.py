from django.urls import path, include
from .views import (
    my_course,
    teach_course,
    join_course,
    course_detail,
    course_update,
    #course_delete,
    course_drop,
    sem_course_home,
    member_profile,
    
)
from . import views


urlpatterns = [
    path('<year>/<sem>/home', sem_course_home, name='sem_course_home'),
    path('<year>/<sem>/course/new', teach_course, name='course_teach'),
    path('<year>/<sem>/course/join', join_course, name='course_join'),
    path('my_course/<userid>/', my_course, name='my_course'),

    path('<year>/<sem>/course/<crn>/', course_detail, name='course_detail'),
    path('<year>/<sem>/course/<crn>/drop', course_drop, name='course_drop'),
    path('<year>/<sem>/course/<crn>/update', course_update, name='course_update'),
    path('<year>/<sem>/course/<crn>/member/<userid>', member_profile, name='member_profile'),
    #path('course/<crn>/delete', course_delete, name='course_delete'),
    
    path('<year>/<sem>/course/<crn>/project/', include('project.urls')),
    
  
]