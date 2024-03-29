# Generated by Django 2.2.3 on 2019-07-30 23:26

import django.core.validators
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stage', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('feedback', models.TextField(max_length=1000)),
                ('rate', models.CharField(choices=[(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5')], default=5, max_length=2)),
                ('date_rated', models.DateField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stage', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('title', models.CharField(max_length=20)),
                ('goal', models.TextField(max_length=600)),
                ('status', models.CharField(choices=[('Done', 'Done'), ('Not Done', 'Not done')], max_length=10)),
                ('schedule', models.DateField()),
            ],
        ),
    ]
