def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp.downcase

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp.downcase
  end

  students

end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each.with_index(1) {
    |student, i| puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

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
print(students)
find_student(students)
student_length(students)
print_footer(students)
