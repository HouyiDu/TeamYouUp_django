from django.db import models
from user.models import User

# Create your models here.

class Course(models.Model):
    crn = models.CharField(max_length=10)
    course_name = models.CharField(max_length=20, primary_key=True)
    instructor = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.course_name