require('sinatra')
require('sinatra/reloader')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/scrabble_score')

get('/') do
  erb(:input)
end
get('/output') do
  @word = params.fetch("word")
  word = Word.new(@word)
  if word.all_letters?
    @score = "0"
    @string_to_display = "Not a valid Scrabble word! Use only letters."
  else
    @score = word.scrabble
  end
  erb(:output)
end
