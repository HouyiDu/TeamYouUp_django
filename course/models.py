from django.db import models
from django.core.validators import (
    MaxValueValidator, 
    MinValueValidator,
    MinLengthValidator)

#from django.contrib.auth.models import User
from django.urls import reverse


# Create your models here.
class Semester(models.Model):
    y2019 = '2019'
    y2018 = '2018'
    y2017 = '2017'
    y2016 = '2016'
    y2015 = '2015'
    y2014 = '2014'
    y2013 = '2013'
    y2012 = '2012'
    y2011 = '2011'
    y2010 = '2010'


    YEAR_CHOICES = [
        (y2019, '2019'),
        (y2018, '2018'),
        (y2017, '2017'),
        (y2016, '2016'),
        (y2015, '2015'),
        (y2014, '2014'),
        (y2013, '2013'),
        (y2012, '2012'),
        (y2011, '2011'),
        (y2010, '2010'),
    ]

    FA = 'Fall'
    SP = 'Spring'
    SU = 'Summer'
    WINTER = 'Winter'

    SEM_CHOICES = [
        (FA, 'Fall'),
        (SP, 'Spring'),
        (SU, 'Summer'),
        (WINTER, 'Winter'),
    ]

    year = models.CharField(choices=YEAR_CHOICES, max_length=6)
    semester = models.CharField(choices=SEM_CHOICES, max_length=6)

    class Meta:
        unique_together = ['year','semester']
    
    def __str__(self):
        name = str(self.year) + ' ' +str(self.semester)
        return name



class Course(models.Model):
    semester = models.ForeignKey(Semester, on_delete=models.CASCADE)
    crn = models.CharField(max_length=5, 
                        validators=[MinLengthValidator(5)], primary_key=True)
    department = models.CharField(max_length=10)
    course_number = models.CharField(max_length=10)
    course_title = models.CharField(max_length=60)
    level = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    
    def __str__(self):
        return self.course_number
    


class CourseMember(models.Model):
    student = models.ForeignKey('user.Student', on_delete=models.CASCADE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    
    class Meta:
        unique_together: [('student','course')]



class CourseStaff(models.Model):
    instructor = models.ForeignKey('user.Instructor', on_delete=models.CASCADE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    
    class Meta:
        unique_together: [('student','course')]



class SkillsTaught(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    skill = models.ForeignKey('user.Skill', on_delete=models.CASCADE)

    class Meta:
        unique_together = ['skill', 'course']
    

