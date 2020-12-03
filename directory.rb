def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array</span>
  students = []
  # get the first name</span>
  name = gets.chomp
  # while the name is not empty, repeat this code</span>
  while !name.empty?
    # add the student hash to the array</span>
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
    # get another name from the user</span>
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
  puts "The students of Villains Academy\n-------------"
  # print banner
end

def print(students)
  students.each_with_index do |student,index| 
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
  #print all students
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
  # print no. of students
end

students = input_students
print_header
print(students)
print_footer(students)