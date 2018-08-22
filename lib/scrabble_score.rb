require 'pry'

class Word
  include Enumerable

  def initialize(str)
    @word = str
  end
  def neutralize
    if !(@word[/[a-zA-Z]+/]  == @word)
      return "Not a valid Scrabble word"
    else
      characters = @word.upcase().chars()
    end
  end

  def scrabble
    scores = { "D" => 2, "G" => 2, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
    @scores = scores
    ones = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
    ones.map { |i| @scores.store(i, 1) }
    threes = ["B", "C", "M", "P"]
    threes.map { |i| @scores.store(i, 3) }
    fours = ["F", "H", "V", "W", "Y"]
    fours.map { |i| @scores.store(i, 4) }
    sum = 0
    neutralize.map { |i| sum = sum + @scores.fetch(i) }
    return sum
  end
end
