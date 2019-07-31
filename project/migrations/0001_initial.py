# Generated by Django 2.2.3 on 2019-07-30 23:26

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120)),
                ('durations', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('stage_num', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('team_size', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('due', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='SkillRequired',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='project.Project')),
            ],
        ),
    ]