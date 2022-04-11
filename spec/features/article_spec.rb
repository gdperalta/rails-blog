require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Articles', type: :feature do
  describe 'view all articles' do
    before { visit articles_path }

    it 'shows all articles in the body' do
      within 'body' do
        expect(page).to have_content('Hello from index page')
        # expect(page).to have_content('New Articles')
      end
    end
  end

  describe 'Articles form' do
    before { visit new_article_path }
    context 'when all fields are valid' do
      it 'Submits the form' do
        fill_in 'Title', with: 'My title'
        fill_in 'Content', with: 'My content'

        click_button 'Create Article'

        expect(page).to have_content 'a new article is created'
      end
    end
  end
end
