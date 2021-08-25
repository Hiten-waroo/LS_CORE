# Question_1 What would you expect the code below to print out?
numbers = [1, 2, 2, 3]
numbers.uniq # this does not mutate

puts numbers # [1, 2, 2, 3]


# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
# ! and ? are characters from method name - they dont actually do anything in Ruby

=begin
what is != and where should you use it? 
  this is not equal
put ! before something, like !user_name
  turn opposite of the boolean - eg if object is true - then !object = false
put ! after something, like words.uniq! 
  if ! is part of the method name then this would do what the method is suppose to - eg .uniq! mutates
put ? before something
  ? : is teriary operater for if..else
put ? after something 
  nothing
put !! before something, like !!user_name  
  turn object to boolean equivant 
=end

# Question 3 Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!("important", "urgent") 
puts advice

#Question 4
#The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # deletes index 1 = 2
numbers.delete(1) # deletes the array value 1

#Question 5 Programmatically determine if 42 lies between 10 and 100.

(10..100).cover?(42)

#Question 6 show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

"Four score and " + famous_words

famous_words = "seven years ago..."

famous_words.insert(0, "Four score and ")

##LS solution
famous_words.prepend("Four score and ")
"Four score and " << famous_words

#Question 7 - If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.

flintsones.flatten! #  ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Pebbles"]


# Question 8 - Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney") # ["Barney", 2]
