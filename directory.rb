class print_students

  def initialize(students)
    @@students = students
    @@students.length > 0 ? print_menu : (puts "There are no students at Villains Academy")
  end

  def print_header
    puts "The students of Villains Academy\n-------------"
    # print banner
  end

  def print_students_list
    @@students.each_with_index do |student,index| 
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    #print all students
  end

  def print_by_cohort
    all_cohorts = @@students.group_by {|student| student[:cohort]}
    all_cohorts.each do |cohort, students|
      puts cohort
      students.each { |student| puts student[:name] }
    end
  end

  def print_students_beginning_with
    puts "Please enter the initial you want to search with"
    letter = gets.chomp.upcase
    @@students.each_with_index do |student,index|
      if student[:name][0] == letter
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end

  def print_short_names
    puts "Please enter the max name length"
    length = gets.chomp.to_i
    @@students.each_with_index do |student,index|
      if student[:name].length < length
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
  
  def print_footer
    puts "Overall, we have #{@@students.count} student#{@@students.count == 1 ? "" : "s"}"
    # print no. of students
  end

  def print_menu
    loop do
      puts "-------- Menu --------"
      menu = ["Print all students", "Print sorted by cohorts", "Print student names beginning with...", "Print names that are shorter than....", "Exit"]
      menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
      selection = gets.chomp
      print_header if (1..5).include?(selection)
      case selection
        when "1"
          print_students_list
        when "2"
          print_by_cohort
        when "3"
          print_students_beginning_with
        when "4"
          print_short_names
        when "5"
          break
        else
          puts "I don't know what you mean, try again"
      end
      print_footer if (1..5).include?(selection)
    end
  end

end

class directory

  def initialize
    @@students = []
    @@quit = false
    main_menu until @@quit
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
    name = gets.chomp.split.map(&:capitalize).join(' ')
    # get the input, split it up per word, captialise them all, then join them again
    while !name.empty?
      cohort, hobbies, country_of_birth, height = get_extra_data
      @@students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
      puts "Now we have #{@@students.count} student#{@@students.count == 1 ? "" : "s"}"
      name = gets.chomp
    end
  end

  def main_menu
    puts "-------- Menu --------"
    menu = ["Input the students", "Show the students", "Exit"]
    menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
    selection = gets.chomp
    case selection
      when "1"
        input_students
      when "2"
        new print_students(@@students)
      when "3"
        @@quit = true
      else
        puts "I don't know what you mean, try again"
    end
  end

end