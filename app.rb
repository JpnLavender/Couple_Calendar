require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require './models.rb'

get '/' do
  erb :index
end
 
get '/sign_in' do
  @sign_action, @sign_submit_text = "/sign_in", "Login"
  erb :sign
end

get '/sign_up' do
  @sign_action, @sign_submit_text = "/sign_up", "CreateAccount"
  erb :sign
end
