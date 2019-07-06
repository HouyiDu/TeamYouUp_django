"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from user.views import student_register, instructor_register, student_profile, instructor_profile
from user.views import dashboard as student_dashboard

from django.contrib.auth import views as auth_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('student_register/', student_register, name='student_register'),
    path('student_profile/', student_profile, name='student_profile'),
    path('instructor_profile/', instructor_profile, name='instructor_profile'),
    path('instructor_register/', instructor_register, name='instructor_register'),
    path('dashboard/', student_dashboard, name='student_dashboard'),
    #path('course_dashboard/', course_dashboard, name='course_dashboard'),
    path('login/', auth_views.LoginView.as_view(template_name='user/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(template_name='user/logout.html'), name='logout'),
   
]
