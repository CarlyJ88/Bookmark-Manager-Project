require 'bookmarks'

feature 'index page' do
  scenario 'user sees a welcome message on the index page' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'viewing bookmarks' do
  scenario 'user can see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end
end
