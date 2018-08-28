require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the scrabble score path', {:type => :feature}) do
  it('processes the user entry and returns a list of items') do
    visit('/')
    fill_in('word', :with => 'hello')
    #save_and_open_page
    click_button('Go!')
    expect(page).to have_content('Your Scrabble word hello has a Scrabble Score of 8.')
  end
end
