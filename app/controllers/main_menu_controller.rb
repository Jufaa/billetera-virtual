require_relative 'application_controller'

class MainMenuController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/main_menu' do
    @all_transfers = all_transfers
    erb :main_menu
  end
end
