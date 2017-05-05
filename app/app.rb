ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :encrypted_sessions, true

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/links/new' do
    erb(:new_links)
  end

  get '/tags/:name' do
    all_links = Link.all
    @links = []
    all_links.each do |link|
      @links << link if link.tags.map(&:name).include?(params[:name])
    end
    erb(:links)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    names = params[:tag].split(', ')
    names.each do |tag|
      link.tags << Tag.create(name: tag)
      link.save
    end
    redirect '/links'
  end


  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end
end
