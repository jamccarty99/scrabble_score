require 'pry'

class Word
  def initialize(str)
    @word = str
  end
  def all_letters?
    if !(@word[/[a-zA-Z]+/]  == @word)
      return "Not a valid Scrabble word"
    end
  end
  def neutralize
    characters = @word.upcase().chars()
  end

  def scrabble
    scores = { "D" => 2, "G" => 2, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
    @scores = scores
    ones = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    ones.each do |i|
      @scores.store(i, 1)
    end
    threes = ["B", "C", "M", "P"]
    threes.each do |i|
      @scores.store(i, 3)
    end
    fours = ["F", "H", "V", "W", "Y"]
    fours.each do |i|
      @scores.store(i, 4)
    end
    sum = 0
    neutralize.each do |i|
      sum = sum + @scores.fetch(i)
    end
    return sum
  end
end
