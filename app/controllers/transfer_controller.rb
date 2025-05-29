require_relative 'application_controller'
require_relative '../models/account'
require 'sinatra/base'

class TransferController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/transfer' do
    erb :transfer
  end

  post '/transfer' do
    target_account = Account.find_by(alias: params[:alias]) || Account.find_by(cvu: params[:cvu])
    origin_account = current_account
    origin_balance = params[:balance].to_f

    if target_account.nil?
      redirect '/transfer_failed'
    end

    if target_account.id == origin_account.id
      redirect '/transfer_failed'
    end

    if origin_balance <= 0 || origin_balance > origin_account.money_balance
      redirect '/transfer_failed'
    else
      origin_account.balance -= origin_balance
      target_account.balance += origin_balance
      target_account.save
      origin_account.save
      redirect '/transfer_success'
    end
  end
end


