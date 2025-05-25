require_relative 'application_controller'

class TransferSuccessController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/transfer_success' do
    erb :transfer_success
  end
end