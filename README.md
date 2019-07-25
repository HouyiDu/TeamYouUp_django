# TeamYouUp_django

requirement: mysql, python (3.7), pip

(previous versions not tested)

### instructions:

1. starter commands

```
$ pip install pip install virtualenv
$ git clone https://github.com/webchar00/TeamYouUp_django
$ cd env && source bin/activate && cd src
$ pip install django, mysqlclient
```

2. setup database

> create mysql database named "cs411"
> (with preferred way, e.x phpmyadmin or terminal command)

> optional:
> setup phpmyadmin to check database 
> create user with username "phpmyadmin" password "root"
> create a new database named "cs411"


3. setup migrations and run server

  in src folder:
```
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver
```

check web on 
```
localhost:8000
```




