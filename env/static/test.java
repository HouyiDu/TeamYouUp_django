

public class Student{
    int student_id;
    HashMap<Ineger, Ineger> skillset;

    public Student(int student_id){
        this.student_id = student_id;
    }
}
  

    
public class Team{
    int team_id;
    int skill_num;
    HashSet<Integer> members;

    public Team(int skill_num, int id){
        this.team_id = id;
        this.skill_num = skill_num;
    }
}

Team[] match_helper(int[] skills_required, HashSet<Student> students, int team_size){

}


    team_num = (len(students) / team_size) 
    if team_num.is_integer() == False:
        team_num = int(team_num) + 1
    else:
        team_num = int(team_num)

    threshold = team_num / len(students) * 100
    
    teams = []
    for i in range(team_num):
        teams.append(Team(0, i))   

    if len(skills_required) < team_size:
        for skill in skills_required:
            teams = sorted(teams, key=lambda team: team.skill_num)

            
            i = 0
            while( len(students) >0 ):

                if i >= team_num:
                    break

                student = students.pop(0)
                skill_level = student.skillset.get(skill)
                #print(skill_level)
                if float(skill_level) > threshold:
                    t = teams[i]
                    i = i + 1
                    t.members.append(student.student_id)
                    t.skill_num += skill_level/100
                    print(t.teamid)
                    print(t.members)
  
                else:
                    students.append(student)

 
    #while(len(students) > 0):
    for i in range(team_num):
        
        while len(teams[i].members) < team_size:
            student = students.pop()
            teams[i].members.append(student.student_id)


    return teams


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


student0.skillset = {1: 20, 2:60, 3:20}
student1.skillset = {1: 80, 2:20, 3:50  }
student2.skillset = {1: 90, 2:40, 3:20  }
student3.skillset = {1: 40, 2:80, 3:90  }
student4.skillset = {1: 20, 2:30, 3:50  }
student5.skillset = {1: 90, 2:70, 3:20  }
student6.skillset = {1: 90, 2:40, 3:20  }
student7.skillset = {1: 80, 2:20, 3:60  }
student8.skillset = {1: 40, 2:90, 3:30  }
student9.skillset = {1: 60, 2:70, 3:20  }
student10.skillset = {1: 30, 2:80, 3:50  }
student11.skillset = {1: 70, 2:50, 3:20  }

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



teams = match_helper(skills_required, students, 4)
for team in teams:
    print(team.members)
