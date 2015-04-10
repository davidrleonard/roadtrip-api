require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require './config/environments'
# our models
require './models/article'
require './models/narrative'
require './models/layer'

# Base route, just a friendly hello for now

get '/' do
  redirect 'articles/create/'
end

# Editing interface

get '/articles/create/?' do
  erb :"articles/create", :layout => :layout
end

get '/narratives/create/?' do
  @article = Article.find_by(source_url: params['source_url'])
  erb :"narratives/create", :layout => :layout
end

get '/layers/create/?' do
  erb :"layers/create", :layout => :layout
end

# Get an article

get '/articles/?' do
  pass if params['source_url'].nil?

  content_type :json

  @article = Article.find_by(source_url: params['source_url'])
  @article.to_json
end

# Get all articles

get '/articles/?' do
  content_type :json
  
  @articles = Article.all
  @articles.to_json
end

# FIRST STEP IN CREATION PROCESS
# Create an article

post '/articles/' do
  content_type :json

  @article = Article.new(params)

  if @article.save
    # @article.to_json
    redirect request.referrer + '/narratives?source_url=' + @article[:source_url]
  else
    "Sorry, there was a problem."
  end
end

#  Create a narrative section

post '/narratives/:id' do
  content_type :json

  @article = Article.find_by(source_url: params['source_url'])
  @narrative = @article.narratives.create(params)

  if @narrative.save
    @narrative.to_json
    # redirect request.referrer + '/layers?source_url=' + @article[:source_url]
  else
    "Sorry, there was a problem."
  end
end