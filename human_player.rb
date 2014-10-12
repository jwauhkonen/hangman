class HumanPlayer
  
  attr_reader :name, :secret_word, :guessed_letters
  
  def initialize(name)
    @name = name
    @secret_word = pick_secret_word
    @guessed_letters = []
  end
  
  def pick_secret_word
    
  end
  
  def word_so_far
    word_so_far = @secret_word.dup
    word_so_far.each_with_index do |char, i|
      if guessed_letters.include?(char)
        word_so_far[i] = "_"
      end
    end
    
    word_so_far
  end
  
  def guess
    guess = gets.chomp
  end
  
  def prompt_guess
    p word_so_far
    p "letters guessed: #{guessed_letters}"
  end
  
end
