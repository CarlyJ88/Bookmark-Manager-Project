require 'sinatra'
require './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    p ENV
    
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0

end
