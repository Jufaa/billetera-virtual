require_relative 'application_controller'

class ChangeUserDataController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/change_user_data' do
    erb :change_user_data
  end

   post '/change_name' do
    current_user.name = params[:account_alias]
    current_user.save
    redirect '/change_user_data'
  end

  post '/change_lastname' do
    current_user.lastname = params[:account_alias]
    current_user.save
    redirect '/change_user_data'
  end

  post '/change_dni' do
    current_user.dni = params[:account_alias]
    current_user.save
    redirect '/change_user_data'
  end

  post '/change_email' do
    current_user.email = params[:account_alias]
    current_user.save
    redirect '/change_user_data'
  end

  post '/change_phone' do
    current_user.phone_number = params[:account_alias]
    current_user.save
    redirect '/change_user_data'
  end
end
