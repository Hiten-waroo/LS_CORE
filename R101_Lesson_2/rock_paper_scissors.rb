# rock_paper_sissors.rb
VALID_CHOICES = { r: "rock",
                  p: "paper",
                  s: "scissors",
                  l: "lizard",
                  sp: "spock" }

GAME_LOGIC = {  r: ['scissors', 'lizard'],
                p: ['rock', 'spock'],
                s: ['paper', 'lizard'],
                l: ['spock', 'paper'],
                sp: ['rock', 'scissors'] }

VALID_YES = ["yes", "y"]

scores = {  player: 0,
            computer: 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  system 'clear'
end

def win?(player1, player2)
  GAME_LOGIC[player1].include?(VALID_CHOICES[player2])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("Its a tie!")
  end
end

def computer_chooses
  VALID_CHOICES.keys().sample()
end

def shw_value(value)
  VALID_CHOICES[value]
end

def player_choose
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.values().join(', ')}")
    choice = Kernel.gets().chomp().to_sym()

    if VALID_CHOICES.keys().include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end
  choice
end

def score_count(score, player, computer)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def grand_champ(scores)
  if scores[:player] == 3
    prompt("Player is GRAND CHAMP")
  elsif scores[:computer] == 3
    prompt("Computer is GRAND CHAMP")
  end
end

def clear_score(score)
  score.keys.each { |key| score[key] = 0 }
end

def play_again
  prompt("Y/Yes rematch. Any other key to exit")
  answer = Kernel.gets().chomp().downcase()
  VALID_YES.include?(answer)
end

def display_score(scores)
  prompt("Player score: #{scores[:player]}")
  prompt("Computer score: #{scores[:computer]}")
end

game_rules = <<-MSG
=============================================================================
Inputs:
r = rock
p = paper
s = scissors
l = lizard
sp = spock

how to win:
Scissors cuts Paper covers Rock crushes 
Lizard poisons Spock smashes Scissors 
decapitates Lizard eats Paper disproves 
Spock vaporises Rock breaks Scissors
=============================================================================
MSG

def see_rules(game_rules)
  prompt("Do you want to see the game rules?")
  answer = Kernel.gets().chomp().downcase()
  if VALID_YES.include?(answer)
    puts(game_rules)
  end
end

welcome_message = <<-MSG
=============================================================================
            Welcome to Rock, Paper, Sissors, Lizard, Spock
=============================================================================
MSG

clear_screen
puts(welcome_message)

see_rules(game_rules)

loop do
  choice = player_choose
  comp_choice = computer_chooses

  prompt("Player: #{shw_value(choice)} VS Computer: #{shw_value(comp_choice)}")
  display_results(choice, comp_choice)
  score_count(scores, choice, comp_choice)
  display_score(scores)
  grand_champ(scores)
  if scores.key(3)
    break unless play_again
    clear_score(scores)
    clear_screen
  end
end

prompt("Thank you for playing, goodbye")
