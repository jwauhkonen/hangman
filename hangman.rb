require_relative 'human_player'
require_relative 'computer_player'

class Hangman
  
  attr_reader :turns_taken, :guessing_player, :checking_player
  
  def initialize(guessing_player, checking_player)
    @guessing_player = guessing_player
    @checking_player = checking_player
    @turns_taken = 0
  end
  
  def run
    checking_player.pick_secret_word
    
    until game_over
      checking_player.prompt_guess
      guess = guessing_player.guess
      checking_player.handle_guess(guess)
      @turns_taken += 1
    end
    
    puts "Game over!"
  end
  
  def game_over
    win? || lose?
  end
  
  def win?
    if checking_player.secret_word == checking_player.word_so_far
      puts checking_player.word_so_far
      p "#{guessing_player.name} wins!"
      return true
    end
    
    false
  end
  
  def lose?
    if turns_taken >= 20
      p "#{guessing_player.name} loses!"
      return true
    end
    
    false
  end
    
    
  
end


jonny = HumanPlayer.new("jonny")
compy = ComputerPlayer.new("compy")

hangman = Hangman.new(jonny, compy)

hangman.run

