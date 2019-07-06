from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import (User, Student, Instructor)



class StudentRegisterForm(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(max_length=20)
    last_name = forms.CharField(max_length=20)
    netid = forms.CharField(max_length=20)

    class Meta:
        model = User
        fields = ['username','first_name','last_name', 'netid','email', 'password1', 'password2',]

    def save(self, commit=True):
        user = super().save(commit=False)
        user.is_student = True
        user.save()
        new_user =  Student.objects.create(user=user)
        new_user.email = self.cleaned_data.get('email')
        new_user.firstName = self.cleaned_data.get('first_name')
        new_user.lastName = self.cleaned_data.get('last_name')
        new_user.netid = self.cleaned_data.get('netid')
        new_user.save()



class InstructorRegisterForm(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(max_length=20)
    last_name = forms.CharField(max_length=20)
    netid = forms.CharField(max_length=20)

    class Meta:
        model = User
        fields = ['username','first_name','last_name', 'netid','email', 'password1', 'password2',]

    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.is_instructor = True
        user.save()
        new_user =  Instructor.objects.create(user=user)
        new_user.email = self.cleaned_data.get('email')
        new_user.firstName = self.cleaned_data.get('first_name')
        new_user.lastName = self.cleaned_data.get('last_name')
        new_user.netid = self.cleaned_data.get('netid')
        new_user.save()

class UserUpdateFOrm(forms.ModelForm):
    email = forms.EmailField()
    
    class Meta:
        model = User
        fields = ['username', 'email']


class StudentProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = ['standing',  'firstName','lastName']
        

class InstructorProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Instructor
        fields = ['firstName', 'lastName']
