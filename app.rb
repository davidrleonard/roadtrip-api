require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'json'
require './config/environments'
require './models/article'

get '/' do
  "Hello, World!"
end

get '/article' do
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

get '/test/' do
  params.to_string
end