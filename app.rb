require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/article'

get '/' do
  "Hello, World!"
end