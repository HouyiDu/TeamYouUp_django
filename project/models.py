from django.db import models
from django.utils import timezone 

# Create your models here.
from django.core.validators import (
    MaxValueValidator, 
    MinValueValidator,
    MinLengthValidator)

from django.urls import reverse


class Project(models.Model):
    name = models.CharField(max_length=120)
    durations = models.IntegerField(validators=[MinValueValidator(1)])
    stage_num = models.IntegerField(validators=[MinValueValidator(1)])
    team_size = models.IntegerField(validators=[MinValueValidator(1)])
    course = models.ForeignKey('course.Course', on_delete=models.CASCADE)
    due = models.DateTimeField(auto_now=False)

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse('team_create', args=(course), kwargs={'id': self.pk})


class SkillRequired(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    skill = models.ForeignKey('user.skill', on_delete=models.CASCADE)

    class Meta:
        unique_together = ['project', 'skill']