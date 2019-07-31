from django.db import models
from django.contrib.auth.models import AbstractUser, Group, GroupManager
from django.core.validators import MaxValueValidator, MinValueValidator
from project.models import Project
from django.urls import reverse


# Create your models here.
class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_instructor = models.BooleanField(default=False)

class Student(models.Model):
    
    UNDERGRAD = 'Undergrad'
    GRAD = 'Grad'

    STANDING_CHOICES = [
        (UNDERGRAD, 'Undergrad'),
        (GRAD, 'Graduate'),
        
    ] 
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    netid = models.CharField(max_length=20,default='z',unique=True)
    email = models.EmailField(max_length=200, unique=True)
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    standing = models.CharField(choices=STANDING_CHOICES,max_length=10,null=True)
    
    def __str__(self):
        return self.user.username



class Skill(models.Model):
    skill_name = models.CharField(max_length=30,default='')
    
    def __str__(self):
        return self.skill_name


class Skillset(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    skill = models.ForeignKey(Skill, on_delete=models.CASCADE)
    score = models.IntegerField(validators=[MinValueValidator(0)])
    
    class Meta:
        unique_together = ['student','skill']
    

class Instructor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    netid = models.CharField(max_length=20,default='z')
    email = models.EmailField(max_length=200, unique=True)
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    
    def __str__(self):
        return self.user.username

