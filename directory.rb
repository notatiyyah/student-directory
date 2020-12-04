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
  puts "Please enter the max name length"
  length = gets.chomp.to_i
  students.each_with_index do |student,index|
    if student[:name].length < length
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

def print_menu(students)
  loop do
    puts "-------- Menu --------"
    menu = ["Print all students", "Print sorted by cohorts", "Print student names beginning with...", "Print names that are shorter than....", "Exit"]
    menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
    selection = gets.chomp
    case selection
      when "1"
        print(students)
      when "2"
        print_by_cohort(students)
      when "3"
        print_students_beginning_with(students)
      when "4"
        print_short_names(students)
      when "5"
        break
      else
        puts "I don't know what you mean, try again"
    end
  end
end

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
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.split.map(&:capitalize).join(' ')
  # get the input, split it up per word, captialise them all, then join them again
  # while the name is not empty, repeat this code
  while !name.empty?
    # add the student hash to the arra
    cohort, hobbies, country_of_birth, height = get_extra_data
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
    puts "Now we have #{students.count} student#{students.count == 1 ? "" : "s"}"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_header
  puts "The students of Villains Academy\n-------------"
  # print banner
end


def print_footer(students)
  puts "Overall, we have #{students.count} student#{students.count == 1 ? "" : "s"}"
  # print no. of students
end

def main_menu
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
          print_menu(students)
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

main_menu