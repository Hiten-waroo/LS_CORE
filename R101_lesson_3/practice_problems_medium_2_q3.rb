def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" #this is  not mutable
  an_array_param << "rutabaga" #this is mutable
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"  #this remains "pumpkins" as method += is not mutable
puts "My array looks like this now: #{my_array}" #rutabaga is added to the array as << is mutable

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga' # this is mutable method so will update the string varible
  an_array_param = ['pumpkins', 'rutabaga'] # this sets parameter array
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#Questiion 5 LS solution
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param # return the two parameter varibles
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array) # set the varibles to the methods parameter varible return

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 6  How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# my solution
def color_valid(color)
color == "blue" || color == "green"
end
