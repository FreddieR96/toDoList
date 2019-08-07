class Todo
def initialize
@maintext
@subpoints = []
end
attr_accessor :maintext
attr_accessor :subpoints
def setTodo
@file = File.new("store.txt", "a+")
@file.syswrite("\n")
puts "Please enter the main text of the todo"
answer = gets.chomp
@maintext = answer
@file.syswrite(answer)
@file.close
end

def setSubPoints

puts "Please enter a subpoint, 'q' to quit:"
answer = gets.chomp

while answer != "q" do
@file = File.new("store.txt", "a+")
puts answer
p @subpoints
@subpoints.push(answer)
@file.syswrite("," + answer)
puts "Please enter a subpoint, 'q' to quit:"
answer = gets.chomp
@file.close
end

end

def to_s
puts(@maintext + "\n\n")
@subpoints.each do |b|
puts(b + "\n")
end
end
end