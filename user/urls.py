from django.urls import path
from . import views
from .views import (
    SignUpView,
    add_skill_lib,
    update_skill_score,
    delete_skill,
    delete_skill_lib,
    update_system_skill_score,

)

urlpatterns = [
    path('', SignUpView.as_view(), name='signup'),
    path('', views.dashboard, name='student-dashboard'),
    path('skill/add_lib', add_skill_lib, name='add_skill_lib'),
    path('skill/update_score', update_skill_score, name='update_skill_score'),
    path('skill/<int:skill_id>/delete', delete_skill, name='delete_skill'),
    path('skill/<int:skill_id>/delete_lib', delete_skill_lib, name='delete_skill_lib'),
    path('system/update/skill', update_system_skill_score, name='update_system_skill_score'),

]