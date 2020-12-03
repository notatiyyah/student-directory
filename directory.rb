def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array</span>
  students = []
  # get the first name</span>
  name = gets.chomp.split.map(&:capitalize).join(' ')
  # get the input, split it up per word, captialise them all, then join them again
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
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
  #print all students
end

def print_students_beginning_with(students)
  puts "Please enter the initial you want to search with"
  letter = gets.chomp.upcase
  students.each_with_index do |student,index|
    if student[:name][0] == letter
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
  # print no. of students
end

students = input_students
print_header
print_students_beginning_with(students)
print_footer(students)