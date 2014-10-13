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

  
  def guess_letter(word_so_far)
    p all_valid_words(word_so_far)
    guess = best_guess(word_so_far)
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
  
  def best_guess(word_so_far)
    valid_words = all_valid_words(word_so_far)
    all_chars = valid_words.join("").split("")
    @guessed_letters.each { |letter| all_chars.delete(letter) }
    most_common_char(all_chars)
  end
  
  
  private

  def all_valid_words(word_so_far)
    invalid_words = []

    valid_words_by_length.each do |word|
      word_chars = word.split("")

      word_chars.each_with_index do |char, i|
        if word_so_far[i] != "_" && word_so_far[i] != char
          invalid_words << word
        elsif word_so_far[i] == "_" && @guessed_letters.include?(char)
          invalid_words << word
        end
      end
    end

    valid_words_by_length  - invalid_words
  end
  
  def most_common_char(all_chars)
    char_count = {}
    all_chars.each { |char| char_count[char] = all_chars.count(char) }
    most_common_char = all_chars[0]
    char_count.each do |char, count|
      if count > char_count[most_common_char]
        most_common_char = char
      end
    end
    most_common_char
  end
  
  def valid_words_by_length
    @dictionary.select { |word| word.length == @word_length }
  end
  
  # def valid_guesses
  #   ('a'..'z').select { |letter| !@guessed_letters.include?(letter) }
  # end
  
  def populate_dictionary(file)
    File.readlines(file).map { |word| word.chomp }
  end
  
  
end