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

post '/sign_in' do
  user = User.find_by_mail(params[:mail])
  if user && user.authenticate(params[:password])
    session[:user] = user.user_token
    redirect '/'
  else
    redirect '/sign_in'
  end
end

get '/sign_up' do
  @sign_action, @sign_submit_text = "/sign_up", "CreateAccount"
  erb :sign
end

post '/sign_up' do
  unless User.where(user_name: params[:user_name]).exists?
    User.create(mail: params[:mail], user_token: Create.token ,password: params[:password], password_confirmation: params[:password])
    redirect '/'
  else
    redirect '/sign_up'
  end
end
