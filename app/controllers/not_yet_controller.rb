require_relative 'application_controller'

class NotYetController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/not_yet' do
    erb :not_yet
  end
end