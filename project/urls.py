from django.urls import path, include
from .views import (
    add_project,
    project_detail,
    project_detail,
    project_update,
    project_extension,
    project_skillrequired,
    match,
)
from . import views

urlpatterns = [
    path('new/', add_project, name='project_create'),
    path('<project_id>/', project_detail, name='project_detail'),
    path('<project_id>/update', project_update, name='project_update'),
    path('<project_id>/skill_required', project_skillrequired, name='project_skillrequired'),
    path('<project_id>/extend', project_extension, name='project_extension'),
    path('<project_id>/', include('team.urls')),
    path('<project_id>/match', match, name='match'),

]