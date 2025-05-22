require_relative 'application_controller'

class MyProfileController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/my_profile' do
    erb :my_profile
  end
end
