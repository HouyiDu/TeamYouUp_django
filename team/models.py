from django.db import models
from django.db import models
from django.contrib.auth.models import AbstractUser, Group, GroupManager
from django.core.validators import MaxValueValidator, MinValueValidator
from project.models import Project
from django.urls import reverse

# Create your models here.

class Team(models.Model):
    project = models.ForeignKey('project.Project', on_delete=models.CASCADE)
    course = models.ForeignKey('course.Course', on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    size = models.IntegerField(validators=[MinValueValidator(1)])
    availability = models.BooleanField(default=True)
    captain = models.ForeignKey('user.User', on_delete=models.CASCADE,default='1')
    grade = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])

    class Meta:
        unique_together = ['project', 'captain']

    def __str__(self):
        return self.name
    



class Membership(models.Model):
    student = models.ForeignKey('user.Student', on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    captain = models.ForeignKey('user.User', on_delete=models.CASCADE)
    project = models.ForeignKey('project.Project', on_delete=models.CASCADE)
    course = models.ForeignKey('course.Course',on_delete=models.CASCADE)

    class Meta:
        unique_together = [['student', 'project','course']]

