from django.shortcuts import render
from .models import Course
from django.views.generic import CreateView

# Create your views here.
def dashboard(request):
    context = {
        'courses': Course.objects.all()
    }
    return render(request, 'course/dashboard.html', context)

class CourseCreateView(CreateView):
    model = Course
    fields = ['course_name', 'instructor']