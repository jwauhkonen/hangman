class HumanPlayer
  
  attr_reader :name, :secret_word, :guessed_letters
  
  def initialize(name)
    @name = name
    @guessed_letters = []
  end
  
  def pick_secret_word
    secret_word = ""
    
    puts "How many letters long is your word?"
    word_length = gets.chomp.to_i
    word_length.times { secret_word += "_" }
    
    @secret_word = secret_word
  end
  
  def word_so_far
    @secret_word.dup
  end

  def guess_letter
    puts "letters guessed: #{guessed_letters}"
    guess = gets.chomp
    
    if guessed_letters.include?(guess)
      raise puts "You already guessed that!"
    elsif !('a'..'z').include?(guess)
      raise puts "You must guess a single lowercase character"
    end
    
    
    @guessed_letters << guess
    guess
    
  rescue
    retry
  end
  
  def check_guess(guess)
    puts "at what indices, if any, does #{guess} appear? (separate with comma or <enter> for none)"
    indices = gets.chomp.split(",").map { |num| num.to_i }
    
    @guessed_letters << guess
    
    secret_word_chars = @secret_word.split("")
    secret_word_chars.each_index do |i|
      secret_word_chars[i] = guess if indices.include?(i)
    end
    
    @secret_word = secret_word_chars.join("")
    puts word_so_far
  end
  
  def receive_secret_length(word)
    puts "This word has #{word.length} letters"
    word.length
  end

end
