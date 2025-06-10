require_relative 'application_controller'

class ChangeUserDataController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/change_user_data' do
    erb :change_user_data
  end
end
