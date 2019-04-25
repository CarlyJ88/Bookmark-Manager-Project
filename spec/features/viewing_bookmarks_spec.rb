require 'bookmarks'

feature 'index page' do
  scenario 'user sees a welcome message on the index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'viewing bookmarks' do
  scenario 'user can see a list of bookmarks' do

    Bookmarks.create(url: "http://www.makersacademy.com")
    Bookmarks.create(url: "http://www.destroyallsoftware.com")
    Bookmarks.create(url: "http://www.google.com")

    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end
end

  feature 'adding bookmarks' do
    scenario 'A user can add a new bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      click_button('Submit')

      expect(page).to have_content 'http://testbookmark.com'
    end
  end
