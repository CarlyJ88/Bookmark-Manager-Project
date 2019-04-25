require 'bookmarks'

describe Bookmarks do

  describe '.all' do
    it 'returns a list of bookmarks' do

      Bookmarks.create(url: "http://www.makersacademy.com")
      Bookmarks.create(url: "http://www.destroyallsoftware.com")
      Bookmarks.create(url: "http://www.google.com")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmarks.create(url: 'http://www.testbookmark.com')

      expect(Bookmarks.all).to include 'http://www.testbookmark.com'
    end
  end
end
