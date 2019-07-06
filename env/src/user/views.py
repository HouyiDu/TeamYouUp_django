from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import (StudentRegisterForm, InstructorRegisterForm, 
UserUpdateFOrm, StudentProfileUpdateForm, InstructorProfileUpdateForm)
from django.contrib.auth.decorators import login_required


# Create your views here.

def student_register(request):
    if request.method == 'POST':
        form = StudentRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Your account has been created! You are now able to login')
            return redirect('login')
    else:
        form = StudentRegisterForm()
    return render(request, 'user/student_register.html', {'form': form})


def instructor_register(request):
    if request.method == 'POST':
        form = InstructorRegisterForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'Iour account has been created! You are now able to login')
            return redirect('login')
    else:
        form = InstructorRegisterForm()
    return render(request, 'user/instructor_register.html', {'form': form})


@login_required
def dashboard(request):
    return render(request, 'user/dashboard.html', {})


@login_required
def student_profile(request):
    if request.method == 'POST':
        u_form = UserUpdateFOrm(request.POST, instance=request.user)
        p_form = StudentProfileUpdateForm(request.POST, 
                                    instance=request.user.student)
        

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('student_profile')

    else:
        u_form = UserUpdateFOrm(instance=request.user)
        p_form = StudentProfileUpdateForm(instance=request.user.student)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }
    return render(request, 'user/student_profile.html', context)




@login_required
def instructor_profile(request):
    if request.method == 'POST':
        u_form = UserUpdateFOrm(request.POST, instance=request.user)
        p_form = InstructorProfileUpdateForm(request.POST, 
                                    instance=request.user.instructor)
        

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'Your account has been updated!')
            return redirect('instructor_profile')

    else:
        u_form = UserUpdateFOrm(instance=request.user)
        p_form = InstructorProfileUpdateForm(instance=request.user.instructor)

    context = {
        'u_form': u_form,
        'p_form': p_form
    }

    return render(request, 'user/instructor_profile.html',context)
