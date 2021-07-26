# calculator_walkthorough.rb

# ask thre user for two numbers
# ask the user for an operaton to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

# at the top of file

require 'yaml'
MSG = YAML.load_file('calc_msgs.yml')


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multipling"
  when '4'
    "Dividing"
  end

end

prompt(MSG['welcome'])

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MSG['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ""
  loop do
    prompt(MSG['first_num'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MSG['not_valid'])
    end
  end

  number2 = ""
  loop do
    prompt(MSG['second_num'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MSG['not_valid'])
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
      prompt(MSG['must_choose'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  result =  case operator
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
  prompt(MSG['another_go'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MSG['bye_bye'])
