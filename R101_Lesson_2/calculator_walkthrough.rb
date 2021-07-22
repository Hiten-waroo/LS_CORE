# calculator_walkthorough.rb

# ask thre user for two numbers
# ask the user for an operaton to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("welcome to calculator")

Kernel.puts("whats the first number")
number1 = Kernel.gets().chomp()

Kernel.puts("whats the second number")
number2 = Kernel.gets().chomp()

Kernel.puts("whats the opersation would you like to perform. 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end


Kernel.puts("the result is #{result}")