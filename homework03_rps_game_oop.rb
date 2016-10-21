# Homework02 Rock-Paper-Scissors game，by Object-Oriented Programming

require 'pry'

# Define Player class，craete game player ----------------------------
class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = nil
  end
end

# Define UserPlayer class，create user player and throw --------------
class UserPlayer < Player
  def choose_hand
    begin
      puts 'Please choose one of the following:'
      puts '  R ==> Rock'
      puts '  P ==> Paper'
      puts '  S ==> Scissors'
      user_input = gets.chomp.upcase
    end while !['R', 'P', 'S'].include?(user_input)
    self.hand = user_input
  end
end

# Define ComputerPlayer class，create computer player and throw -------
class ComputerPlayer < Player
  def choose_hand
    self.hand = ['R', 'S', 'P'].shuffle.first
  end
end

# Define RockPaperScissors class，play Rock-Paper-Scissors game -------
class RockPaperScissors
  attr_accessor :user_player, :computer_player

  def initialize
    @user_player = UserPlayer.new(input_user_name)
    @computer_player = ComputerPlayer.new("Matrix")
  end

  # Define input_user_name，get the user player's name
  def input_user_name
    system 'clear'
    puts '**************************************************************'
    puts 'Rock Paper Scissor Game!!!'
    puts 'Please enter your name:'
    gets.chomp.capitalize!
  end

  # Define opening, print out user player's name and welcome ---------------
  def opening
    puts '**************************************************************'
    puts ''
    puts "   #{user_player.name}! Welcome to Rock Paper Scissors!"
    puts ''
    puts '**************************************************************'
  end

  # Define Function to Transfer input to string !---------------------------
  def transfer_input_string(input)
    hands = {
      'R' => 'Rock',
      'P' => 'Paper',
      'S' => 'Scissors'
    }
    hands[input]
  end

  # Define check_who_win, check who win the game ---------------------------
  def check_who_win(user_input, computer_input)
    if user_input == computer_input
      "Haha! It is a draw! #{user_player.name}, you can try again!"
    elsif user_input == 'R'
      if computer_input == 'S'
        "Wow! Rock smashes Scissors! #{user_player.name}, you Win!"
      elsif computer_input == 'P'
        "Oh! Paper covers Rock! #{user_player.name}, you Lose!"
      end
    elsif user_input == 'P'
      if computer_input == 'R'
        "Wow! Paper covers Rock! #{user_player.name}, you Win!"
      elsif computer_input == 'S'
        "Oh! scissors cuts Paper! #{user_player.name}, you Lose!"
      end
    elsif user_input == 'S'
      if computer_input == 'P'
        "Wow! Scissors cuts Paper! #{user_player.name}, you Win!"
      elsif computer_input == 'R'
        "Oh! Rock smashes Scissors! #{user_player.name}, you Lose!"
      end
    end
  end

  # Define print_result, print out the game result -------------------------
  def print_result(user_input, computer_input, who_win)
    puts '**************************************************************'
    puts ''
    puts "#{user_player.name} choose: #{transfer_input_string(user_input)}"
    puts "The computer chooses: #{transfer_input_string(computer_input)}"
    puts "*** #{who_win}!! ***"
    puts ''
    puts '**************************************************************'
  end

  # Define continu，ask user to try again ----------------------------------
  def continue?
    begin
      puts "Would you like to play again?: Y / N"
      continue = gets.chomp.upcase
    end while !["Y", "N"].include?(continue)
    continue
  end

  # Define ending, print the closing remarks -------------------------------
  def ending
    system 'clear'
    puts '**************************************************************'
    puts ''
    puts '             Good Bye! Thanks for playing!'
    puts ''
    puts '**************************************************************'
  end

  # Define play_rps_game, play Rock-Paper-Scissors game --------------------
  def play_rps_game
    begin
      system 'clear'
      opening
      user_player.choose_hand
      computer_player.choose_hand
      who_win = check_who_win(user_player.hand, computer_player.hand)
      print_result(user_player.hand, computer_player.hand, who_win)
    end while continue? == "Y"
    ending
  end

end

# Main Program!! ------------------------------------------------------------
 # new RockPaperScissors and call play ---------------------------------------
RockPaperScissors.new.play_rps_game
