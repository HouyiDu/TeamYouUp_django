from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from user.models import  Student
from team.models import Team
from django.utils import timezone
# Create your models here.


class Feedback(models.Model):
    SCORE_CHOICE = [
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    ]

    team = models.ForeignKey('team.Team', on_delete=models.CASCADE)
    stage = models.IntegerField(validators=[MinValueValidator(1)])
    grader = models.ForeignKey('user.Student',on_delete=models.CASCADE,related_name='grader')
    receiver = models.ForeignKey('user.Student', on_delete=models.CASCADE, related_name='receiver')
    feedback = models.TextField(max_length=1000)
    rate = models.CharField(choices=SCORE_CHOICE, max_length=2,default=5)
    date_rated = models.DateField(default=timezone.now)



class Task(models.Model):
    DONE = 'Done'
    NOT = 'Not Done'

    STATUS = [
        (DONE, 'Done'),
        (NOT, 'Not done')
    ]
    student = models.ForeignKey('user.Student',on_delete=models.CASCADE,related_name='task_student')
    team = models.ForeignKey('team.Team', on_delete=models.CASCADE,related_name='task_team')
    stage = models.IntegerField(validators=[MinValueValidator(1)])
    title = models.CharField(max_length=20)
    goal = models.TextField(max_length=600)
    status = models.CharField(choices=STATUS, max_length=10)
    schedule = models.DateField(auto_now=False)

