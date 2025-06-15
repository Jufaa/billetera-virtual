require 'sinatra/base'
require_relative 'application_controller'
require_relative '../models/account'
class RouletteController < ApplicationController
set :views, File.expand_path('../../views', __FILE__)

  get '/roulette' do
    erb :roulette
  end

  post '/roulette' do
    bet = 10
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
      @message = "No ganaste nada."
    when 1
      account.balance += 50
      @message = "¡Premio 1: ganaste 50 monedas!"
    when 2
      account.balance += 100
      @message = "¡Premio 2: ganaste 100 monedas!"
    when 3
      @message = "Premio 3: ¡ganaste un bonus especial!"
    else
      account.balance += 20
      @message = "¡Premio #{premio_id}: ganaste 20 monedas!"
    end

    account.save
    erb :roulette
  end
end
