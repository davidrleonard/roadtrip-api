require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require 'open-uri'
require 'nokogiri'
# config for db
require './config/environments'
# our models
require './models/article'
require './models/narrative'
require './models/layer'
# helpers
require './scrape'

# Base route, just a friendly hello for now

get '/' do
  redirect 'articles/create'
end

###############################################################
## ARTICLES
## has_many :narratives
#######

# Interface to edit articles

get '/articles/create/?' do
  erb :"articles/create", :layout => :baselayout
end

# Endpoint to create articles

post '/articles/' do
  content_type :json

  @article = Article.new(params)

  if @article.save
    redirect '/narratives/create?source_url=' + @article[:source_url]
  else
    "Sorry, there was a problem."
  end
end

# Render the article for the reader
get '/articles/read/?' do
  @article = Article.where(source_url: params['source_url']).last
  @narrative = Narrative.where(source_url: params['source_url']).last
  @layers = Layer.where(source_url: params['source_url'])

  erb :"articles/read"
end

#######
## ARTICLES EXTERNAL API
#######

# Get a specific article

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


###############################################################
## NARRATIVES
## belongs_to :article
## has_many :narratives
#######

# Interface to edit narratives

get '/narratives/create/?' do
  @article = Article.where(source_url: params['source_url']).last
  # for now, just grab one pic
  @pic = get_photos(@article['source_url']).first

  erb :"narratives/create", :layout => :baselayout
end

# Endpoint to create narratives

post '/narratives/' do
  content_type :json

  @article = Article.where(source_url: params['source_url']).last
  @narrative = Narrative.new(params)

  if @narrative.save
    redirect '/layers/create?source_url=' + @article[:source_url] + '&photo_url=' + @narrative[:photo_url] 
  else
    "Sorry, there was a problem."
  end
end

###############################################################
## LAYERS
## belongs_to :narrative
#######

# Interface to edit layers

get '/layers/create/?' do
  @article = Article.where(source_url: params['source_url']).last
  @narrative = Narrative.find_by(photo_url: params['photo_url'])
  # @layers = Layer.find_by(photo_url: params['photo_url'])

  erb :"layers/create", :layout => :baselayout
end

# Endpoint to create narratives

post '/layers/' do

  @article = Article.where(source_url: params['source_url']).last
  @narrative = Narrative.find_by(photo_url: params['photo_url'])
  @layer = Layer.new(params)

  if @layer.save
    @layers = Layer.where(photo_url: params['photo_url'])
    erb :"layers/create", :layout => :baselayout
  else
    "Sorry, there was a problem."
  end
end