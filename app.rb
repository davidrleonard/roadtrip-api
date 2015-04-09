require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './articles/article'

get '/' do
  "Hello, World!"
end