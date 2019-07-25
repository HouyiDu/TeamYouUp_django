

class Student:
    student_id = 0

    def __init__(self, stid):
        self.student_id = stid
        self.skillset = {}

    
class Team:
    teamid = 0
    skill_num = 1.0
    member_num = 1

    def __init__(self, skill_num, teamid, member_num):
        self.skill_num = skill_num
        self.teamid = teamid
        self.member_num = member_num
        self.members = []
    
    def teamadd(self, s, skill):
        self.skill_num += skill
        if s not in self.members:
            self.members.append(s)
            self.member_num = self.member_num+1
        




def match_helper(skills_required, students, team_size):
    original_length = len(students)

    team_num = (len(students) / team_size) 
    print(original_length)

    if team_num.is_integer() == False:
        team_num = int(team_num) + 1
    else:
        team_num = int(team_num)

    threshold = team_num / len(students) * 100
    
    teams = []
    li = []
    for i in range(team_num):
        t = Team(0, i, 0)
        teams.append(t)

    if len(skills_required) < team_size:
        for skill in skills_required:
            teams = sorted(teams, key=lambda team: team.skill_num)
            students = sorted(students, key=lambda student: student.skillset.get(skill),reverse=True)

            i = 0
            loopcount = 0
            while( len(students) >0 ):

                if i >= team_num:
                    break
                loopcount+=1

                if(loopcount >= original_length):
                    break

                student = students.pop(0)
 

                # print('student',student.student_id)
                skill_level = student.skillset.get(skill)
                
                if float(skill_level) > threshold:
                    t = teams[i]
                    t.teamadd(student.student_id, skill_level/100)
                    print('student',student.student_id)
                    i = i + 1
                    print('team', t.teamid, t.members)
                    # tu = ()
                    # tu = tu + (t.teamid, )
                    # tu = tu + (student.student_id, )
                    # li.append(tu)
                    
  
                else:
                    students.append(student)
        print('this for loop')

        i = 0
        while len(students) > 0:
            i = (i + 1)%team_num
            t = teams[i]
            student = students.pop()
            # print('team', t.teamid)
            t.teamadd(student.student_id, 0)
            # tu = ()
            # tu = tu + (t.teamid, )
            # tu = tu + (student.student_id, )
            # li.append(tu)



        # for i in range(team_num):
                
        #     while (teams[i].member_num) < team_size:
        #         if(len(students) == 0):
        #             break

        #         student = students.pop()
        #         print('student', student.student_id)
        #         t = teams[i]
        #         #print('team', t.teamid)
        #         t.teamadd(student.student_id, 0)
        #         tu = ()
        #         tu = tu + (t.teamid, )
        #         tu = tu + (student.student_id, )
        #         li.append(tu)

  
    return teams


# skills_required = [1, 2, 3 ]
# students = []

# student0 = Student(0)
# student1 = Student(1)
# student2 = Student(2)
# student3 = Student(3)
# student4 = Student(4)
# student5 = Student(5)
# student6 = Student(6)
# student7 = Student(7)
# student8 = Student(8)
# student9 = Student(9)
# student10 = Student(10)
# student11 = Student(11)


# student0.skillset = {1: 20, 2:60, 3:20}
# student1.skillset = {1: 80, 2:20, 3:50  }
# student2.skillset = {1: 90, 2:40, 3:20  }
# student3.skillset = {1: 40, 2:80, 3:90  }
# student4.skillset = {1: 20, 2:30, 3:50  }
# student5.skillset = {1: 90, 2:70, 3:20  }
# student6.skillset = {1: 90, 2:40, 3:20  }
# student7.skillset = {1: 80, 2:20, 3:60  }
# student8.skillset = {1: 40, 2:90, 3:30  }
# student9.skillset = {1: 60, 2:70, 3:20  }
# student10.skillset = {1: 30, 2:80, 3:50  }
# student11.skillset = {1: 70, 2:50, 3:20  }

# students.append(student0)
# students.append(student1)
# students.append(student2)
# students.append(student3)
# students.append(student4)
# students.append(student5)
# students.append(student6)
# students.append(student7)
# students.append(student8)
# students.append(student9)
# students.append(student10)
# students.append(student11)

skills_required = [1, 2, 3 ]
students = []

student0 = Student(0)
student1 = Student(1)
student2 = Student(2)
student3 = Student(3)
student4 = Student(4)
student5 = Student(5)
student6 = Student(6)
student7 = Student(7)
student8 = Student(8)
student9 = Student(9)
student10 = Student(10)
student11 = Student(11)
student12 = Student(12)
student13 = Student(13)
student14 = Student(14)
student15 = Student(15)
student16 = Student(16)
student17 = Student(17)
student18 = Student(18)
student19 = Student(19)
student20 = Student(20)
student21 = Student(21)
student22 = Student(22)
student23 = Student(23)
student24 = Student(24)
student25 = Student(25)
student26 = Student(26)
student27 = Student(27)
student28 = Student(28)
student29 = Student(29)
student30 = Student(30)
student31 = Student(31)
student32 = Student(32)
student33 = Student(33)
student34 = Student(34)
student35 = Student(35)
student36 = Student(36)
student37 = Student(37)
student38 = Student(38)
student39 = Student(39)
student40 = Student(40)
student41 = Student(41)
student42 = Student(42)
student43 = Student(43)
student44 = Student(44)
student45 = Student(45)
student46 = Student(46)
student47 = Student(47)
student48 = Student(48)
student49 = Student(49)
student50 = Student(50)
student51 = Student(51)
student52 = Student(52)
student53 = Student(53)
student54 = Student(54)
student55 = Student(55)
student56 = Student(56)
student57 = Student(57)
student58 = Student(58)
student59 = Student(59)
student60 = Student(60)


student0.skillset = {1: 93, 2:10, 3:20}
student1.skillset = {1: 92, 2:11, 3:50  }
student2.skillset = {1: 91, 2:12, 3:20  }
student3.skillset = {1: 90, 2:13, 3:90  }
student4.skillset = {1: 89, 2:14, 3:50  }
student5.skillset = {1: 88, 2:15, 3:20  }
student6.skillset = {1: 87, 2:16, 3:20  }
student7.skillset = {1: 86, 2:17, 3:60  }
student8.skillset = {1: 85, 2:18, 3:30  }
student9.skillset = {1: 84, 2:19, 3:20  }


student10.skillset = {1: 83, 2:20, 3:20}
student11.skillset = {1: 82, 2:21, 3:50  }
student12.skillset = {1: 81, 2:22, 3:20  }
student13.skillset = {1: 80, 2:23, 3:90  }
student14.skillset = {1: 79, 2:24, 3:50  }
student15.skillset = {1: 78, 2:25, 3:20  }
student16.skillset = {1: 77, 2:26, 3:20  }
student17.skillset = {1: 76, 2:27, 3:60  }
student18.skillset = {1: 45, 2:28, 3:30  }
student19.skillset = {1: 44, 2:29, 3:20  }

student20.skillset = {1: 43, 2:30, 3:20}
student21.skillset = {1: 42, 2:31, 3:50  }
student22.skillset = {1: 41, 2:32, 3:20  }
student23.skillset = {1: 40, 2:33, 3:90  }
student24.skillset = {1: 39, 2:34, 3:50  }
student25.skillset = {1: 38, 2:35, 3:20  }
student26.skillset = {1: 37, 2:36, 3:20  }
student27.skillset = {1: 36, 2:37, 3:60  }
student28.skillset = {1: 35, 2:38, 3:30  }
student29.skillset = {1: 34, 2:39, 3:20  }

student30.skillset = {1: 33, 2:41, 3:20}
student31.skillset = {1: 32, 2:42, 3:50  }
student32.skillset = {1: 31, 2:43, 3:20  }
student33.skillset = {1: 30, 2:44, 3:90  }
student34.skillset = {1: 29, 2:45, 3:50  }
student35.skillset = {1: 28, 2:46, 3:20  }
student36.skillset = {1: 27, 2:47, 3:20  }
student37.skillset = {1: 26, 2:48, 3:60  }
student38.skillset = {1: 25, 2:49, 3:30  }
student39.skillset = {1: 24, 2:50, 3:20  }

student40.skillset = {1: 23, 2:79, 3:20}
student41.skillset = {1: 22, 2:80, 3:50  }
student42.skillset = {1: 21, 2:81, 3:20  }
student43.skillset = {1: 20, 2:82, 3:90  }
student44.skillset = {1: 29, 2:83, 3:50  }
student45.skillset = {1: 28, 2:84, 3:20  }
student46.skillset = {1: 27, 2:85, 3:20  }
student47.skillset = {1: 26, 2:86, 3:60  }
student48.skillset = {1: 25, 2:87, 3:30  }
student49.skillset = {1: 24, 2:88, 3:20  }

student50.skillset = {1: 23, 2:89, 3:20}
student51.skillset = {1: 22, 2:90, 3:50  }
student52.skillset = {1: 21, 2:91, 3:20  }
student53.skillset = {1: 20, 2:92, 3:90  }
student54.skillset = {1: 19, 2:93, 3:50  }
student55.skillset = {1: 18, 2:94, 3:20  }
student56.skillset = {1: 17, 2:95, 3:20  }
student57.skillset = {1: 16, 2:96, 3:60  }
student58.skillset = {1: 15, 2:97, 3:30  }
student59.skillset = {1: 14, 2:98, 3:20  }
student60.skillset = {1: 14, 2:98, 3:20  }



students.append(student0)
students.append(student1)
students.append(student2)
students.append(student3)
students.append(student4)
students.append(student5)
students.append(student6)
students.append(student7)
students.append(student8)
students.append(student9)


students.append(student10)
students.append(student11)
students.append(student12)
students.append(student13)
students.append(student14)
students.append(student15)
students.append(student16)
students.append(student17)
students.append(student18)
students.append(student19)

students.append(student20)
students.append(student21)
students.append(student22)
students.append(student23)
students.append(student24)
students.append(student25)
students.append(student26)
students.append(student27)
students.append(student28)
students.append(student29)

students.append(student30)
students.append(student31)
students.append(student32)
students.append(student33)
students.append(student34)
students.append(student35)
students.append(student36)
students.append(student37)
students.append(student38)
students.append(student39)

students.append(student40)
students.append(student41)
students.append(student42)
students.append(student43)
students.append(student44)
students.append(student45)
students.append(student46)
students.append(student47)
students.append(student48)
students.append(student49)

students.append(student50)
students.append(student51)
students.append(student52)
students.append(student53)
students.append(student54)
students.append(student55)
students.append(student56)
students.append(student57)
students.append(student58)
students.append(student59)
students.append(student60)



team_num = (len(students) / 4) 
if team_num.is_integer() == False:
    team_num = int(team_num) + 1
else:
    team_num = int(team_num)

teams = match_helper(skills_required, students, 4)
dic = {}

for i in range(team_num):
    dic[i] = []


for team,student in teams:
    dic[team].append(student)
print(dic)
