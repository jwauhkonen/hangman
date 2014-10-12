class ComputerPlayer
  
  attr_reader :name, :dictionary, :secret_word, :guessed_letters
  
  def initialize(name)
    @name = name
    @dictionary = populate_dictionary('dictionary.txt')
    @guessed_letters = []
  end
  
  def pick_secret_word
    @secret_word = @dictionary.sample
    p "This word has #{secret_word.length} letters"
  end
  
  def word_so_far
    word_so_far = @secret_word.dup
    word_so_far_chars = word_so_far.split("")
    
    word_so_far_chars.each_with_index do |char, i|
      unless guessed_letters.include?(char)
        word_so_far_chars[i] = "_"
      end
    end
    
    word_so_far_chars.join("")
  end
  
  def guess
    guess = ('a'..'z').sample
    p guess
  end
    
  def prompt_guess
    puts word_so_far
    puts "letters guessed: #{guessed_letters}"
  end
  
  def handle_guess(guess)
    if @guessed_letters.include?(guess)
      puts "You already guessed that! Way to wasted a guess, idiot!"
    elsif !('a'..'z').include?(guess)
      puts "You're supposed to put a single lowercase character."
      puts "Do you even know how to play this game?"
    else
      @guessed_letters << guess
    end
  end
  
  
  
  private
  
  
  def populate_dictionary(file)
    File.readlines(file).map { |word| word.chomp }
  end
  
  
end