from django import forms

from user.models import  Student
from team.models import Team, Membership
from django.db import connection



# class AddStageForm(forms.Form):
#     major_id= forms.IntegerField(min_value=1)
#     minor_id = forms.IntegerField(min_value=1)



class FeedbackForm(forms.Form):
    SCORE_CHOICE = [
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5')
    ]
    
 
    receiver = forms.CharField(max_length=150, help_text='enter student firstname')
    feedback = forms.CharField(widget=forms.Textarea)
    rate = forms.ChoiceField(choices=SCORE_CHOICE, widget=forms.RadioSelect)
   



class AddTaskForm(forms.Form):
    DONE = 'Done'
    NOT = 'Not done'

    STATUS = [
        (DONE, 'Done'),
        (NOT, 'Not done')
    ]
    title = forms.CharField(max_length=20)
    description = forms.CharField(widget=forms.Textarea)
    status = forms.ChoiceField(choices=STATUS, widget=forms.RadioSelect)
    schedule = forms.DateField(input_formats=['%Y-%m-%d'], help_text='YYYY-MM-DD')

