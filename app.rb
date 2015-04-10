require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require './config/environments'
require './models/article'

get '/' do
  "This is the Roadtrip api. Please see more details at http://github.com/davidrleonard/roadtrip-api"
end

get '/articles/?' do
  pass if params['source_url'].nil?

  content_type :json

  @article = Article.find_by(key: params['source_url'])
  @article.to_json
end

get '/articles/?' do
  content_type :json
  
  @articles = Article.all
  @articles.to_json
end

post '/articles/' do
  content_type :json

  @article = Article.new(params)

  if @article.save
    @article.to_json
  else
    "Sorry, there was a problem."
  end

  "You said #{params}"
end