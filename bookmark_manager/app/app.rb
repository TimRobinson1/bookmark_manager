ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    @links = Link.all
    erb(:links)
  end

end
