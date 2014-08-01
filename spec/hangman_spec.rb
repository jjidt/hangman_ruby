require 'rspec'
require 'word'
require 'game'

describe 'Word' do
  it 'creates a new word object' do
    test_word = Word.new("monkeys")
    expect(test_word).to be_an_instance_of Word
  end

  it 'allows you to access the individual letters in a word' do
      test_word = Word.new("steve")
      expect(test_word.letters).to eq ["s","t","e","v","e"]
    end

  it 'creates a blank array the same length as the word' do
      test_word = Word.new("steve")
      expect(test_word.blanks).to eq ["_","_","_","_","_"]
  end

  describe 'guess' do
    it 'allows you to check if a letter is in the word' do
      test_word = Word.new("steve")
      expect(test_word.guess("t")).to eq true
    end

    it 'logs if a letter has not been guessed already' do
      test_word = Word.new("laundry")
      test_word.guess("r")
      expect(test_word.guessed).to eq ["r"]
    end
  end

  describe 'already_guessed?' do
    it 'tells you if a letter has been guessed' do
      test_word = Word.new("toupee")
      test_word.guess("m")
      expect(test_word.already_guessed?("m")).to eq true
    end

    it 'tells you if a letter has not been guessed' do
      test_word = Word.new("toupee")
      test_word.guess("m")
      expect(test_word.already_guessed?("b")).to eq false
    end
  end

  describe 'replace_blanks' do
    it 'enters each instance of a correctly guessed letter into the blanks array at the correct place' do
      test_word = Word.new("steve")
      test_word.replace_blanks("t")
      expect(test_word.blanks).to eq ["_","t","_","_","_"]
    end
  end
end

describe Game do
  it 'is creates a new game object' do
    test_game = Game.new("JJ")
    expect(test_game).to be_an_instance_of Game
  end
end
