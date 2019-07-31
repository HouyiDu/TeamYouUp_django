from django import forms
from .models import Course, Semester
from user.models import Skill

class TeachCourseForm(forms.Form):
    crn = forms.CharField(max_length=5, min_length=5)



class JoinCourseForm(forms.Form):
    crn = forms.CharField(max_length=5, min_length=5)


class UpdateCourseForm(forms.Form):
    course_number = forms.CharField(max_length=20)
    course_title = forms.CharField(max_length=20)


class Search(forms.Form):
    department = forms.CharField(max_length=20)  