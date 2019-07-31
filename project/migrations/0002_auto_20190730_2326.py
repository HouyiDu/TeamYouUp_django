# Generated by Django 2.2.3 on 2019-07-30 23:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('project', '0001_initial'),
        ('course', '0002_auto_20190730_2326'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='skillrequired',
            name='skill',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.Skill'),
        ),
        migrations.AddField(
            model_name='project',
            name='course',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='course.Course'),
        ),
        migrations.AlterUniqueTogether(
            name='skillrequired',
            unique_together={('project', 'skill')},
        ),
    ]
