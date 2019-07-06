from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import StudentRegisterForm, InstructorRegisterForm

# Create your views here.

def student_register(request):
    if request.method == 'POST':
        form = StudentRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Student account created for {username}!')
            return redirect('dashboard')
    else:
        form = StudentRegisterForm()
    return render(request, 'user/student_register.html', {'form': form})


def instructor_register(request):
    if request.method == 'POST':
        form = InstructorRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Instructor account created for {username}!')
            return redirect('dashboard')
    else:
        form = InstructorRegisterForm()
    return render(request, 'user/instructor_register.html', {'form': form})



def dashboard(request):
    return render(request, 'user/dashboard.html', {})