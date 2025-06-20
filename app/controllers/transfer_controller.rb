require_relative 'application_controller'
require_relative '../models/user'
require_relative '../models/account'
require_relative '../models/transfer'
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

      target_user = User.find_by(id: target_account.user_id)
      @transfer = transfer_account.transfers.create(
      amount: transfer_balance,
      name: target_user.name,
      lastname: target_user.lastname,
      destiny_account_cvu: target_account.cvu,
      transfer_date: Time.now,
      )
      redirect '/transfer_success'
    end
  end
end
