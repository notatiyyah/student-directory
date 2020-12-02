def print_banner
    puts "The students of Villains Academy\n-------------"
    # print banner
end

def print_students(students)
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
    #print all students
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
    # print no. of students
end

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# store all students' info in an array

print_banner
print_students(students)
print_footer(students)