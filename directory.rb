def input_students
  puts "Please enter the details of the student(s)"
  puts "To finish, just hit return twice"

  students = []
  puts "Student Name:"
  name = gets.chomp.downcase
  puts "Student date of Birth:"
  date_of_birth = gets.chomp
  puts "Favourite Hobby"
  hobby = gets.chomp.downcase

  while !name.empty? do

    students << {name: name, date_of_birth: date_of_birth, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp.downcase
  end

  students

end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print3(students)
  # answer helped by https://stackoverflow.com/questions/53211334/ruby-until-loop-undefined-method-for-nilnilclass-nomethoderror/53211611#53211611
  i = 0
   until i == students.length

     puts "#{i+1} Name: #{students[i][:name]}  D.O.B: #{students[i] [:date_of_birth]} Favourite Hobby: #{students[i] [:hobby]} (#{students[i][:cohort]} cohort)"
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

def find_student(students)
    puts "Enter first letter of student(s) you wish to search for:"
    searched_letter = gets.chomp.downcase
    search_result = 0
    students.each do |student|
      if student[:name].start_with?(searched_letter)
        puts "#{search_result+=1}: #{student[:name]}"

      end
    end
end

def student_length(students)
  puts "Enter the maximum desried characters in searched name:"
  character_limit = gets.chomp.to_i
  search_result = 0
  students.each do |student|
    if student[:name].length <= character_limit
      puts "#{search_result+=1}: #{student[:name]}"
    end
  end
end



def print_footer(students)
  puts "\n Overall, we have #{students.count} great students"
end

students = input_students
print_header
print3(students)
find_student(students)
student_length(students)
print_footer(students)
