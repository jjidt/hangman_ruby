require './lib/word.rb'
require './lib/game.rb'
require 'random-word'

def prompt(string)
  puts string
  gets.chomp
end

system("clear")
puts "
╭╮╱╭╮╭━━━╮╭━╮╱╭╮╭━━━╮╭━╮╭━╮╭━━━╮╭━╮╱╭╮
┃┃╱┃┃┃╭━╮┃┃┃╰╮┃┃┃╭━╮┃┃┃╰╯┃┃┃╭━╮┃┃┃╰╮┃┃
┃╰━╯┃┃┃╱┃┃┃╭╮╰╯┃┃┃╱╰╯┃╭╮╭╮┃┃┃╱┃┃┃╭╮╰╯┃
┃╭━╮┃┃╰━╯┃┃┃╰╮┃┃┃┃╭━╮┃┃┃┃┃┃┃╰━╯┃┃┃╰╮┃┃
┃┃╱┃┃┃╭━╮┃┃┃╱┃┃┃┃╰┻━┃┃┃┃┃┃┃┃╭━╮┃┃┃╱┃┃┃
╰╯╱╰╯╰╯╱╰╯╰╯╱╰━╯╰━━━╯╰╯╰╯╰╯╰╯╱╰╯╰╯╱╰━╯
"

player_name = prompt("Please Enter Your Name")

new_game = Game.new(player_name)

system("clear")

puts "Hi #{player_name}, welcome!\n"
prompt("Press Enter To Play")

loop do
  system("clear")

  puts "Guess this word: \n"

  puts "#{new_game.game_word.blanks.join(" ")}\n"

  puts "Guessed letters:\n #{new_game.game_word.guessed.join(", ")}"
  puts "#{new_game.whammy}/6 whammies!"
  user_letter = ""

  loop do
    user_letter = prompt("Guess a letter")
    break if user_letter.scan(/[a-z]/).length > 0 && user_letter.length == 1
    puts "Please Enter a Valid Letter"
  end

  new_game.take_turn(user_letter)

  if new_game.game_word.blanks == new_game.game_word.letters
    system("clear")
    puts "YOU WIN!"
    break
  end
  if new_game.whammy >= 6
    system("clear")

    puts "\nTHE WORD WAS #{new_game.game_word.letters.join("")}"

    puts "YOU LOSE!"
    break
  end
end




