from django.urls import path, include
from . import views
from .views import (
    team_view,
    add_team,
    join_team,
    leave_team,
    grade,
)

urlpatterns = [
    path('team/new/', add_team, name='team_create'),
    path('team/join/', join_team, name='join_team'),
    path('team/<int:team_id>/', team_view, name='team_detail'),
    path('team/<int:team_id>/leave/', leave_team, name='leave_team'),
    path('team/<int:team_id>/grade/', grade, name='grade'),
    path('team/<int:team_id>/', include('stage.urls')),
 
]