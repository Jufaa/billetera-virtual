require 'sinatra/base'
require_relative 'application_controller'
require_relative '../models/account'
class RouletteController < ApplicationController
set :views, File.expand_path('../../views', __FILE__)

  get '/roulette' do
    @first_load = true
    erb :roulette
  end

  post '/roulette' do
    bet = 20
    user = current_user
    account = user.account

    if account.balance < bet
      @error_message = "No tenés saldo suficiente para jugar."
      return erb :roulette
    end

    account.balance -= bet
    premio_id = params[:premio_id].to_i
    case premio_id
    when 0
      account.balance += 100
      @message = "Ganaste 100 monedas!"
    when 1
      account.balance += 50
      @message = "Ganaste 50 monedas!"
    when 2
      account.balance += 25
      @message = "Ganaste 25 monedas!"
    when 3
      account.balance += 10
      @message = "Ganaste 10 monedas!"
    when 4, 5, 6, 7, 8, 9
      @message = "No ganaste nada."
    else
      @message = "Error: premio inválido."
    end

    account.save
    erb :roulette
  end
end
