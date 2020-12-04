def get_extra_data
  cohort = "November"
  puts "Enter their cohort, or leave empty for default"
  new_cohort = gets.chomp
  cohort = new_cohort unless new_cohort.empty?
  puts "List some of their hobbies"
  hobbies = gets.chomp
  puts "What is thier country of birth?"
  country_of_birth = gets.chomp
  puts "What's their height?"
  height = gets.chomp
  return cohort, hobbies, country_of_birth, height
end

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
    cohort, hobbies, country_of_birth, height = get_extra_data
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
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

def print_short_names(students)
  students.each_with_index do |student,index|
    if student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_by_cohort(students)
  all_cohorts = students.group_by {|student| student[:cohort]}
  all_cohorts.each do |cohort, students|
    puts cohort
    students.each { |student| puts student[:name] }
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} student#{students.count == 1 ? "" : "s"}"
  # print no. of students
end

def menu
  students = []
  loop do
    puts "-------- Menu --------"
    menu = ["Input the students", "Show the students", "Exit"]
    menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        if students.length > 0
          print_header
          print_by_cohort(students)
          print_footer(students)
        else
          puts "There are no students at Villains Academy"
        end
      when "3"
        break
      else
        puts "I don't know what you mean, try again"
    end
  end
end

menu