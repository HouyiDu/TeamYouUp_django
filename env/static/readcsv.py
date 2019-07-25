import csv

with open('user.csv',newline='') as csvfile:
    reader = csv.reader(csvfile,delimiter=' ', quotechar='|')
    for row in reader:
        for item in row:
            item.split(',')
           