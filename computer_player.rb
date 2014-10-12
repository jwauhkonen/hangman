class ComputerPlayer
  
  attr_reader :name, :dictionary, :secret_word, :guessed_letters
  
  def initialize(name)
    @name = name
    @dictionary = populate_dictionary('dictionary.txt')
    @guessed_letters = []
  end
  
  def pick_secret_word
    @secret_word = @dictionary.sample
  end

  
  def guess_letter
    guess = valid_guesses.sample
    @guessed_letters << guess
    p guess
  end

  def check_guess(guess)
    @guessed_letters << guess
    puts word_so_far
  end
  
  def word_so_far
    word_so_far = secret_word.dup
    word_so_far_chars = word_so_far.split("")

    word_so_far_chars.each_with_index do |char, i|
      unless guessed_letters.include?(char)
        word_so_far_chars[i] = "_"
      end
    end

    word_so_far_chars.join("")
  end
  
  def receive_secret_length(word)
    puts "This word has #{word.length} letters"
    @word_length = word.length
  end
  
  
  private

  def valid_words
    
  end
  
  def valid_words_by_length
    @dictionary.select { |word| word.length == @word_length }
  end
  
  def valid_guesses
    ('a'..'z').select { |letter| !@guessed_letters.include?(letter) }
  end 
  
  def populate_dictionary(file)
    File.readlines(file).map { |word| word.chomp }
  end
  
  
end