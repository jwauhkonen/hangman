require_relative 'human_player'
require_relative 'computer_player'

class Hangman
  
  attr_reader :turns_taken, :guessing_player, :checking_player, :word_so_far
  
  def initialize(guessing_player, checking_player)
    @guessing_player = guessing_player
    @checking_player = checking_player
    @turns_taken = 0
  end
  
  def run
    secret_word = checking_player.pick_secret_word
    guessing_player.receive_secret_length(secret_word)
    puts checking_player.word_so_far
    
    until game_over
      guess = guessing_player.guess_letter(word_so_far)
      checking_player.check_guess(guess)
      @turns_taken += 1
    end
    
    puts "Game over!"
  end
  
  def game_over
    win? || lose?
  end
  
  def win?
    unless checking_player.word_so_far.split("").include?("_")
      puts checking_player.word_so_far
      puts"#{guessing_player.name} wins!"
      return true
    end
    
    false
  end
  
  def lose?
    if turns_taken >= 27
      puts "#{guessing_player.name} loses!"
      return true
    end
    
    false
  end
  
  def word_so_far
    checking_player.word_so_far
  end
    
end


jonny = HumanPlayer.new("jonny")
compy = ComputerPlayer.new("compy")
tandy = ComputerPlayer.new("tandy")

hangman = Hangman.new(compy, jonny)

hangman.run

