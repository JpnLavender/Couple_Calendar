require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require './models.rb'

get '/' do
  erb :index
end
 
get '/sign_in' do
  erb :sign
end

get '/sign_up' do
  erb :sign
end
