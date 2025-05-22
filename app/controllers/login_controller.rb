
require_relative 'application_controller'
require_relative '../models/user'

class LoginController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/login' do
    erb :login
  end

  post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect to('/main_menu')
  else
    @error_message = "Usuario o contraseña incorrectos, email: #{params[:email]}, password: #{params[:password]}"
    erb :login
  end
end


  get '/logout' do
    session.clear
    redirect to('/login')
  end
end
