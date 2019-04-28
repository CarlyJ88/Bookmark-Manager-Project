require 'bookmarks'

feature 'index page' do
  scenario 'user sees a welcome message on the index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'viewing bookmarks' do
  scenario 'user can see a list of bookmarks' do

    Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy all Software")
    Bookmarks.create(url: "http://www.google.com", title: "Google")

    visit('/bookmarks')

    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("Destroy all Software", href: "http://www.destroyallsoftware.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end

  feature 'adding bookmarks' do
    scenario 'A user can add a new bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://testbookmark.com')
      fill_in('title', with: 'Test bookmark')
      click_button('Submit')

      expect(page).to have_content 'Test bookmark'
    end
  end
