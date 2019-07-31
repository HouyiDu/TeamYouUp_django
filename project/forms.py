from django import forms
from user.models import Skill

class AddProjectForm(forms.Form):
    name = forms.CharField(max_length=20)
    team_size = forms.IntegerField(min_value=1)
    durations = forms.IntegerField(min_value=1, help_text="(weeks)")
    stage_num = forms.IntegerField(min_value=1)
    due = forms.DateTimeField( input_formats=['%Y-%m-%d %H:%M'], help_text='YYYY-mm-dd HH:MM')

class ExtendProjectForm(forms.Form):
    due = forms.DateTimeField( input_formats=['%Y-%m-%d %H:%M'], help_text='YYYY-mm-dd HH:MM')


class AddSkillRequired(forms.Form):
    skill = forms.ModelChoiceField(queryset=Skill.objects.all())