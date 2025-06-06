require_relative 'application_controller'
require_relative '../models/account'
require 'sinatra/base'

class TransferController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/transfer' do
    erb :transfer
  end

  post '/transfer' do
    target_account = Account.find_by(account_alias: params[:account_alias]) || Account.find_by(cvu: params[:cvu])
    transfer_account = current_account
    transfer_balance = params[:Dinero].to_i

    if target_account.nil?
      redirect '/transfer_failed'
    end

    if target_account.id == transfer_account.id
      redirect '/transfer_failed'
    end

    if transfer_balance <= 0 || transfer_balance > transfer_account.balance
      redirect '/transfer_failed'
    else
      transfer_account.balance -= transfer_balance
      target_account.balance += transfer_balance
      target_account.save
      transfer_account.save
      redirect '/transfer_success'
    end
  end
end


