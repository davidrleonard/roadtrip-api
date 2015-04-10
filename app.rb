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
  erb :"articles/create", :layout => :layout
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
  @article = Article.find_by(source_url: params['source_url'])
  erb :"narratives/create", :layout => :layout
end

# Endpoint to create narratives

post '/narratives/:id' do
  content_type :json

  @article = Article.find_by(source_url: params['source_url'])
  @narrative = @article.narratives.create(params)

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
  @narrative = Narrative.find_by(photo_url: params['photo_url'])
  @layer = @narrative.layers.create(params)

  erb :"layers/create", :layout => :layout
end

# Endpoint to create narratives

post '/layers/:id' do
  content_type :json

  @article = Article.find_by(source_url: params['source_url'])
  @narrative = Narrative.find_by(photo_url: params['photo_url'])
  @layer = @narrative.layers.create(params)

  if @layer.save
    # redirect 'narratives/create?source_url=' + @article[:source_url] + '&photo_url=' + @narrative[:photo_url] 
    "Success!"
  else
    "Sorry, there was a problem."
  end
end

get '/pics' do
  @photos = get_photos("http://www.chicagotribune.com/news/ct-bison-return-illinois-met-20141006-story.html#page=1")
  @photos.to_json
end