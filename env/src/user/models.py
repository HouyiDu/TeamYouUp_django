from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.contrib.auth.models import AbstractUser, Group


# Create your models here.
class User(AbstractUser):
    is_student = models.BooleanField(default=False)
    is_instructor = models.BooleanField(default=False)

class Student(models.Model):
    FRESHMAN = 'FR'
    SOPHOMORE = 'SO'
    JUNIOR = 'JR'
    SENIOR = 'SR'
    STANDING_CHOICES = [
        (FRESHMAN, 'Freshman'),
        (SOPHOMORE, 'Sophomore'),
        (JUNIOR, 'Junior'),
        (SENIOR, 'Senior'),
    ] 
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    netid = models.CharField(max_length=20,default='z')
    email = models.EmailField(max_length=200, unique=True)
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    standing = models.CharField(choices=STANDING_CHOICES,max_length=2)
    skillset = models.ManyToManyField('Skill')

    def __str__(self):
        return self.user.username


class Skill(models.Model):
    skill_name = models.CharField(max_length=30,default='c++')
    
    def __str__(self):
        return self.skill_name


class Instructor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    netid = models.CharField(max_length=20,default='z')
    email = models.EmailField(max_length=200, unique=True)
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    
    def __str__(self):
        return self.user.username


class Team(models.Model):
    name = models.CharField(max_length=20)
    size = models.IntegerField( validators=[MinValueValidator(1)])
    availability = models.BooleanField(default=True)
    members = models.ManyToManyField(User,through='Membership')

    def __str__(self):
        return self.name

class Membership(models.Model):
    sutdent = models.ForeignKey(User, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    invite_msg = models.CharField(max_length=64)
    