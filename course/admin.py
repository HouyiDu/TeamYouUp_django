from django.contrib import admin

# Register your models here.

from .models import Course, CourseMember, CourseStaff, Semester, SkillsTaught

admin.site.register(Course)
admin.site.register(CourseMember)
admin.site.register(CourseStaff)
admin.site.register(Semester)
admin.site.register(SkillsTaught)