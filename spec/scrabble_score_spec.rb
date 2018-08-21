require('rspec')
require('scrabble_score')

describe('#neutralize') do
  it("returns a capitalized array of letters") do
    word = Word.new("cow")
    expect(word.neutralize()).to(eq(["C", "O", "W"]))
  end
end

describe('#all_letters?') do
  it("returns an error if str is not all letters") do
    word = Word.new("=@*")
    expect(word.all_letters?()).to(eq("Not a valid Scrabble word"))
  end
  it("returns an error if str is not all letters") do
    word = Word.new("co3w")
    expect(word.all_letters?()).to(eq("Not a valid Scrabble word"))
  end
  it("continues on to scrabbel method if it is a valid word") do
    word =Word.new("maximize")
    expect(word.all_letters?()).not_to(eq("Not a valid Scrabble word"))
  end
end
describe('#scrabble_score?') do
  it("returns a scrabble score for a letter") do
    word = Word.new("a")
    expect(word.scrabble()).to(eq(1))
  end
  it("returns a scrabble score for a letter") do
    word = Word.new("y")
    expect(word.scrabble()).to(eq(4))
  end
  it("returns a scrabble score for a word") do
    word = Word.new("hello")
    expect(word.scrabble()).to(eq(8))
  end
end
