@students = []

def interactive_menu
    loop do
    print_menu
    process(gets.chomp)
  end

end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print3
  print_footer
end

def input_students
  puts "Please enter the details of the student(s)"
  puts "To finish, just hit return twice"

  puts "Student Name:"
  name = gets.chomp.downcase
  puts "Student date of Birth:"
  date_of_birth = gets.chomp
  puts "Favourite Hobby"
  hobby = gets.chomp.downcase
  puts "Student Cohort"
  cohort = gets.chomp.downcase.to_sym


  while !name.empty? do

    cohort = :"Not Supplied" if cohort.empty?

    @students << {name: name, date_of_birth: date_of_birth, hobby: hobby, cohort: cohort}
    if @students.count == 1
    puts "Now we have #{@students.count} student".center(80)
    else
      puts "Now we have #{@students.count} students".center(80)
    end

      puts "Student Name:"
    name = gets.chomp.downcase
    if
      name.empty?
      break
    end
    puts "Student date of Birth:"
    date_of_birth = gets.chomp
    puts "Favourite Hobby"
    hobby = gets.chomp.downcase
    puts "Student Cohort"
    cohort = gets.chomp.downcase.to_sym
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each {
    |student|
    student_data = [student[:name], student[:date_of_birth], student[:hobby], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end


def print_header
  puts "The students of Villains Academy".center(200)
  puts "--------------".center(200)
end

def print3
  # answer helped by https://stackoverflow.com/questions/53211334/ruby-until-loop-undefined-method-for-nilnilclass-nomethoderror/53211611#53211611
  i = 0
   until i == @students.length

     puts "#{i+1} Name: #{@students[i][:name]}  D.O.B: #{@students[i] [:date_of_birth]} Favourite Hobby: #{@students[i] [:hobby]} (#{@students[i][:cohort]} cohort)"
     i += 1
   end
end



#def print2(students)
#  i = 0
#  while i < students.length
#    puts "#{i+1} #{students[i][:name]} (#{students[i][:cohort]} cohort)"
#    i +=1
#  end
#end

#def print(students)
#  students.each.with_index(1) {
#    |student, i| puts "#{i}: #{student[:name]} #(#{student[:cohort]} cohort)"
  #}
#end

def find_student
    puts "Enter first letter of student(s) you wish to search for:"
    searched_letter = gets.chomp.downcase
    search_result = 0
    @students.each do |student|
      if searched_letter.empty?
        break
      elsif student[:name].start_with?(searched_letter)
        puts "#{search_result+=1}: #{student[:name]}"
      end
    end
end

def student_length
  puts "Enter the maximum desried characters in searched name:"
  character_limit = gets.chomp.to_i
  search_result = 0
  @students.each do |student|
    if student[:name].length <= character_limit
      puts "#{search_result+=1}: #{student[:name]}"
    end
  end
end



def print_footer
  if @students.count == 1
  puts "\n Overall, we have #{@students.count} great student".center(300)
  else
    puts "\n Overall, we have #{@students.count} great students".center(300)
  end
end

interactive_menu
