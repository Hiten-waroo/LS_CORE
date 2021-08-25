#Question 1 For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!


10.times {|x| puts (" " * x) + "The Flintstones Rock!" }
=begin output
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
   The Flintstones Rock!
    The Flintstones Rock!
     The Flintstones Rock!
      The Flintstones Rock!
       The Flintstones Rock!
        The Flintstones Rock!
         The Flintstones Rock!
=> 10
=end

#Question 2 The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2) # error because concatinating interger to string.

puts "the value of 40 + 2 is " + (40 + 2).to_s #my answer - convert answer to  string

puts "the value of 40 + 2 is #{40 + 2}" # LS alternative solution - you can do string interpolation

#Question 3 Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

#Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

#Bonus 1 What is the purpose of the number % divisor == 0 ? = number % divisor == 0 ? = checks the there is no remainders 

#Bonus 2 = Purpose of line 8 (second to last line) the actual return value from the method - otherwise it would be nil



#Question 4 Question 4
=begin
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?
=end

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element #updates existing array buffer
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] #returns new array called buffer
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin LS solution words
Yes, there is a difference. While both methods have the same return value, in the first implementation, the input argument called buffer will be modified and will end up being changed after rolling_buffer1 returns. That is, the caller will have the input array that they pass in be different once the call returns. In the other implementation, rolling_buffer2 will not alter the caller's input argument.  
=end

#Question 5
=begin
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?
=end

limit = 15 #outside of scope of the definitaion

def fib(first_num, second_num, limit) #add limit as additional argument
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1,limit)
puts "result is #{result}" #13


#Question 6 What is the output of the following code?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # 34 - answer has not been changed - new_anwser is not pointing to the same value


#Question 7 One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

#After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

#Did the family's data get ransacked? Why or why not? - Yes it did. becasue the mess_with_demographics method uses the actual hash values that come in - rather than a copy of.

=begin LS explantion:
The family's data is all in shambles now.
Why? Remember that in Ruby, what gets passed to a method isn't the value of the object. Under the hood, Ruby passes the object_id of each argument to the method. The method stores these object_id's internally in locally scoped (private to the method) variables (named per the method definition's parameter list).
So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.
In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.
=end

#Question 8 Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end


#what will the output be for 
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # "Paper"


#Question 9 Consider these two simple methods:

def foo(param = "no") #this is default param
  "yes"
end

def bar(param = "no") #this is default param
  param == "no" ? "yes" : "no" # foo = yes so answer is no.
end

#What would be the return value of the following method invocation?
bar(foo) # no

#This is because the value returned from the foo method will always be "yes" , and "yes" == "no" will be false.
