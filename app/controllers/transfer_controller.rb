require_relative 'application_controller'
require_relative '../models/user'  # <- Importante también tener esto si usás `User`

class TransferController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/transfer' do
    erb :transfer
  end

  post '/transfer' do

    usuario_destino = User.find_by(alias: params[:alias]) || User.find_by(cvu: params[:alias])
    usuario_original = current_user
    saldo = params[:Dinero].to_f

    if usuario_destino.nil?
      redirect '/transfer_failed'
    end

    if usuario_destino.id == usuario_original.id
      redirect '/transfer_failed'
    end

    if saldo <= 0 || saldo > usuario_original.money_balance
      redirect '/transfer_failed'
    else
      usuario_original.money_balance -= saldo
      usuario_destino.money_balance += saldo
      usuario_destino.save
      usuario_original.save
      redirect '/transfer_success'
    end
  end
end


