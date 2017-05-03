ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  get '/tags/:name' do
    all_links = Link.all
    @links = []
    all_links.each do |link|
      @links << link if link.tags.first.name == params[:name]
    end
    erb(:links)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    link.tags << Tag.create(name: params[:tag])
    link.save
    redirect '/links'
  end

end
