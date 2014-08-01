class Word
  attr_reader :letters, :word, :blanks, :guessed

  def initialize(word)
    @word = word
    @letters = @word.split("")
    @blanks = Array.new(@word.length,"_" )
    @guessed = []
  end

  def guess(letter)
      @guessed << letter
      @letters.include?(letter)
  end

  def already_guessed?(letter)
      @guessed.include?(letter)
  end

  def replace_blanks(letter)
    if guess(letter)
      @letters.each_with_index do |let, index|
        if let == letter
          blanks[index] = letter
        end
      end
    end
  end
end
