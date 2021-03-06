# ask user for two numbers
# ask user for operation
# to perform the opeation on the two numbers
# out put the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'multiplying'
  when '4'
    'dividing'
  end
end

prompt("Welcome to the calculator! Enter your name")

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("add valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ""
  loop do
    prompt("whats the first number")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("not valid number")
    end
  end

  number2 = ""
  loop do
    prompt("whats the second number")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("not valid number")
    end
  end

  operator_prompt = <<-MSG
  What Operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)
  operator = ""
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("the result is #{result}")
  prompt("do you want to perform another calc? Y to do again")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("thank you - have an nice day")
