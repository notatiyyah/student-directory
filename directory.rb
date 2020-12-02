def print_banner
    puts "The students of Villains Academy\n-------------"
    # print banner
end

def print_students(names)
    names.each { |name| puts name }
    #print all students
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
    # print no. of students
end

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# store all students in an array

print_banner
print_students(students)
print_footer(students)