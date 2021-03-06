require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require './models.rb'
enable :sessions

get '/' do
  erb :index
end

get '/calendar' do
  @events = User.find_by(user_token: session[:user]).calendars
  erb :index
end

post '/add_event' do
  user = User.find_by(user_token: session[:user])
  Calendar.create(
    user: user,
    event_title: params[:title],
    bio: params[:note],
    event_start: params[:event_start],
    event_end: params[:event_end]
  )
end

get '/sign_in' do
  @sign_action, @sign_submit_text, @sign_title = "/sign_in", "Login", "sign_in"
  erb :sign
end

post '/sign_in' do
  user = User.find_by_mail(params[:mail])
  if user && user.authenticate(params[:password])
    session[:user] = user.user_token
    redirect '/calendar'
  else
    redirect '/sign_in'
  end
end

get '/sign_up' do
  @sign_action, @sign_submit_text, @sign_title = "/sign_up", "CreateAccount", "sign_up"
  erb :sign
end

post '/sign_up' do
  unless User.where(mail: params[:mail]).exists?
    user = User.create(mail: params[:mail], user_token: Create.user_token ,password: params[:password], password_confirmation: params[:password])
    session[:user] = user.user_token
    redirect '/calendar'
  else
    redirect '/sign_up'
  end
end
