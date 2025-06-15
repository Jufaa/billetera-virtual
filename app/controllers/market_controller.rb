require_relative 'application_controller'
require_relative '../models/account'
require_relative '../models/pet'

class MarketController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  PET_PRICES = {
    1 => 400,  # Cubone
    2 => 200,  # Totodile
    3 => 600   # Charmander
  }

  get '/market' do
    @owned_pet_numbers = Pet.where(user_id: current_user.id).pluck(:pet_number)
    erb :market
  end

  post '/market' do
    pet_number = params[:pet_number].to_i
    price = PET_PRICES[pet_number]

    unless price
      @error = "Mascota inválida."
      @owned_pet_numbers = Pet.where(user_id: current_user.id).pluck(:pet_number)
      return erb :market
    end

    account = current_account

    if Pet.exists?(user_id: current_user.id, pet_number: pet_number)
      @error = "Ya tenés esta mascota."
      @owned_pet_numbers = Pet.where(user_id: current_user.id).pluck(:pet_number)
      return erb :market
    end

    if account.credits >= price
      account.update(credits: account.credits - price)
      Pet.update(user_id: current_user.id, pet_number: pet_number)
      erb :market
    else
      @error = "No tenés créditos suficientes para comprar esta mascota."
      @owned_pet_numbers = Pet.where(user_id: current_user.id).pluck(:pet_number)
      erb :market
    end
  end
end
