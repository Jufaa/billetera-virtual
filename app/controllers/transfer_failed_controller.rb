require_relative 'application_controller'

class TransferFailedController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/transfer_failed' do
    erb :transfer_failed
  end
end