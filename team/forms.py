from django import forms

class AddTeamForm(forms.Form):
    name = forms.CharField(max_length=20)



class JoinTeamForm(forms.Form):
    team = forms.CharField(max_length=10, help_text='please enter team id')



class GradeForm(forms.Form):
    grade = forms.IntegerField(min_value=1, max_value=100, help_text='enter scoree 1-100')
