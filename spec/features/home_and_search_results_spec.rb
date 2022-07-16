require 'rails_helper'

def card_layout_should_be_in(page)
  expect(page).to have_text 'humidity'
  expect(page).to have_text 'visibility'
  expect(page).to have_text 'pressure'
  expect(page).to have_text 'feels like'
end

def search_layout_should_be_in(page)
  expect(page).to have_button 'GO'
  expect(page).to have_field 'location'
  expect(page).to have_selector 'select'
end

RSpec.describe 'Home page and search results', type: :feature do
  describe 'hompage' do
    it 'should look as expected' do
      visit '/'
      card_layout_should_be_in page
      search_layout_should_be_in page
    end
  end

  describe 'searching' do
    it 'displays correctly when searched with given location' do
      visit '/'

      fill_in 'location', with: 'padova'
      click_button 'GO'

      expect(page).to have_text 'Padova'
      card_layout_should_be_in page
      search_layout_should_be_in page
    end

    it 'displays no result when invalid location given' do
      visit '/'

      fill_in 'location', with: 'spjglklilfjflklfk'
      click_button 'GO'

      expect(page).to have_text 'No result for location spjglklilfjflklfk'
      card_layout_should_be_in page
      search_layout_should_be_in page
    end
  end
end
