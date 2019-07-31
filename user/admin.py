from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin
from .models import User, Skill,Student, Instructor
                     


admin.site.register(User, UserAdmin)
admin.site.register(Skill)
admin.site.register(Student)
admin.site.register(Instructor)
