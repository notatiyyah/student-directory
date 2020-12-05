require 'csv'

class PrintStudents

  def initialize(students)
    @@students = students
    @@students.length > 0 ? print_menu : (puts "There are no students at Makers Apprenticeships")
  end

  def print_header
    puts "The students of Makers Apprenticeships\n-------------"
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
    letter = $stdin.gets.chomp.upcase
    @@students.each_with_index do |student,index|
      if student[:name][0] == letter
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end

  def print_short_names
    puts "Please enter the max name length"
    length = $stdin.gets.chomp.to_i
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
      menu = ["Print all students", "Print sorted by cohorts", "Print student names beginning with...", "Print names that are shorter than....", "Go back"]
      menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
      selection = $stdin.gets.chomp
      print_header if (1..5).include?(selection.to_i)
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
      print_footer if (1..5).include?(selection.to_i)
    end
  end

end

class Directory

  def initialize
    @@students = []
    @@quit = false
    main_menu until @@quit
  end

  def get_extra_data
    prompts = [
      "Enter their cohort, or leave empty for default",
      "Enter one of their hobbies",
      "What is thier country of birth?",
      "What's their height?"
    ]
    responses = ["November"]
    prompts.each_with_index do |prompt, index|
      puts prompt
      response = $stdin.gets.chomp
      responses[index] = response unless index == 0 && response.empty? 
    end
    return responses
  end

  def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = $stdin.gets.chomp.split.map(&:capitalize).join(' ')
    # get the input, split it up per word, captialise them all, then join them again
    while !name.empty?
      cohort, hobbies, country_of_birth, height = get_extra_data
      @@students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
      puts "Now we have #{@@students.count} student#{@@students.count == 1 ? "" : "s"}"
      name = $stdin.gets.chomp
    end
  end

  def save_students(filename)
    filename = "students.csv" if filename.nil?
    begin
      CSV.open(filename, "w") do |csv|
        csv << @@students.first.keys # adds the attributes name on the first line
        @@students.each { |student| csv << student.values }
      end
      puts "Finished saving #{@@students.length} student#{@@students.length == 1 ? "" : "s"} to #{filename}"
    rescue NoMethodError
      puts "No students to store in #{filename}"
    end
  end

  def load_from_file(filename)
    filename = "students.csv" if filename.nil?
    keys = ["name", "cohort", "hobbies", "country_of_birth", "height"]
    # all keys for hash
    index = 0
    CSV.foreach(filename) do |student|
      student_hash = Hash[keys.map(&:to_sym).zip(student)]
      # Save each value in the student's row to each key in the list
      @@students << student_hash unless index == 0
      index += 1
    end
    puts "Loaded #{index} student#{@@students.length == 1 ? "" : "s"} from #{filename}"
  end

  def get_filename
    filename = ARGV.first # first argument from the command line
    if filename.nil?
      puts "Enter the file, leave blank for default"
      filename = gets.chomp 
      # if left blank, prompts user for input
    end
    unless filename.nil? || filename.empty?
      if File.exists?(filename)
        return filename # only returns filename if not nil and if file does exist
      else
        puts "Sorry, #{filename} doesn't exist. Loading from default..."
      end
    end
  end

  def main_menu
    puts "-------- Menu --------"
    menu = [
      "Input the students",
      "Show the students",
      "Save student details to file",
      "Load student details from file",
      "Exit"
    ]
    menu.each_with_index {|option, index| puts "#{index+1}. #{option}" }
    selection = $stdin.gets.chomp
    case selection
      when "1"
        input_students
      when "2"
        PrintStudents.new(@@students)
      when "3"
        save_students(get_filename)
      when "4"
        load_from_file(get_filename)
      when "5"
        @@quit = true
      else
        puts "I don't know what you mean, try again"
    end
  end

end

def print_source_code
  this_file = File.basename(__FILE__)
  File.foreach(this_file) { |line| puts line }
end

print_source_code