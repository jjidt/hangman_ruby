class Game
  attr_reader :player_name, :whammy
  attr_accessor :game_word

  def initialize(player_name)
    @player_name = player_name
    rand_word = RandomWord.nouns.next.split("_")[0]
    @game_word = Word.new(rand_word)
    @whammy = 0
  end

  def take_turn(letter)
    @game_word.replace_blanks(letter)
    if !@game_word.guess(letter)
       @whammy += 1
    end
  end
end
