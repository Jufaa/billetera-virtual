require_relative 'application_controller'

class ChangeAccountDataController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/change_account_data' do
    erb :change_account_data
  end

  post '/change_alias' do
    current_account.account_alias = params[:account_alias]
    current_account.save
    redirect '/my_profile'
  end

end
