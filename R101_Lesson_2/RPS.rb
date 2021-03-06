VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win")
  elsif win?(computer, player)
    prompt("Computer wins")
  else
    prompt("its a tie")
  end
end

loop do
  choice = ""
  loop do
    prompt(" Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("thats not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("you chose: #{choice}; computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("thank you for playing, have a nice day")
