from django.urls import path
from .views import(
    # add_stage,
    project_plan,
    give_feedback,
    add_task,
    task_update,
    mark_completed,
    task_detail,
    mark_completed,
    feedback_list,
    view_feedback,
    delete_task,
)

urlpatterns = [
    # path('  stage/new', add_stage, name='add_stage'),
    path('project_plan', project_plan, name='project_plan'),
    path('stage/<int:stage_id>', give_feedback, name='give_feedback'),
    path('stage/<int:stage_id>/feedback/', feedback_list, name='feedback_list'),
    path('stage/<int:stage_id>/feedback/<int:feedback_id>', view_feedback, name='view_feedback'),
    path('stage/<int:stage_id>/task/add', add_task, name='add_task'),
    path('stage/<int:stage_id>/task/<int:task_id>/update', task_update, name='task_update'),
    path('stage/<int:stage_id>/task/<int:task_id>/detail', task_detail, name='task_detail'),
    path('stage/<int:stage_id>/task/<int:task_id>/delete', delete_task, name='delete_task'),
    path('stage/<int:stage_id>/task/<int:task_id>/markcomplete', mark_completed, name='mark_complete'),
]