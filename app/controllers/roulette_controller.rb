require 'sinatra/base'
require_relative 'application_controller'
require_relative '../models/user'
class RouletteController < ApplicationController
set :views, File.expand_path('../../views', __FILE__)

  get '/roulette' do
    @first_load = true
    erb :roulette
  end

  post '/roulette' do
    bet = 20
    user = current_user

    if user.credits < bet
      @error_message = "No tenés saldo suficiente para jugar."
      return erb :roulette
    end

    user.credits -= bet
    premio_id = params[:premio_id].to_i
    case premio_id
    when 0
      user.credits += 100
      @message = "Ganaste 100 monedas!"
    when 1
      user.credits += 50
      @message = "Ganaste 50 monedas!"
    when 2
      user.credits += 25
      @message = "Ganaste 25 monedas!"
    when 3
      user.credits += 10
      @message = "Ganaste 10 monedas!"
    when 4, 5, 6, 7, 8, 9
      @message = "No ganaste nada."
    else
      @message = "Error: premio inválido."
    end

    user.save
    erb :roulette
  end
end
