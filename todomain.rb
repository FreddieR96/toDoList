require [REQUIRE TODOCLASS.RB]
@thetodos = []
def loadToDos
if File::exists?("store.txt")
toDos = IO.readlines("store.txt") 
toDos.each do |todo|
todoString = todo.split(",")
eachTodo = Todo.new
eachTodo.maintext = todoString[0]
todoString.drop(1).each do |f|
eachTodo.subpoints.push(f)
end
@thetodos.push(eachTodo)
end
end
end

def printToDos
@thetodos.each do |x|
x.to_s
end
mainMenu()
end

def deleteToDo
substring = gets.chomp
@deletedtodos = []
@thetodos.each do |x|
if x.maintext.include? substring
@deletedtodos.push(x)
end
end
@thetodos -= @deletedtodos
File.delete("store.txt")
@file = File.new("store.txt", "a+")
@thetodos.each do |a|
writestring = a.maintext
a.subpoints.each do |b|
writestring += ("," + b)
end
writestring += ("\n")
@file.syswrite(writestring)
end
@file.close
mainMenu()
end

def addToDo
theTodo = Todo.new
theTodo.setTodo()
theTodo.setSubPoints()
@thetodos.push(theTodo)
mainMenu()
end

def mainMenu
puts "'a' to view todos, 'b' to add a todo, 'c' to remove a todo, 'd' to exit"
answerchar = gets.chomp
if answerchar == "a"
printToDos()
elsif answerchar == "b"
addToDo()
elsif answerchar == "c"
deleteToDo()
elsif answerchar == "d"
abort
else
mainMenu()
end
end

loadToDos()
mainMenu()