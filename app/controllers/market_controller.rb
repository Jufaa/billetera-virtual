require_relative 'application_controller'
require_relative '../models/user'
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
    @owned_pet_numbers = current_user.pets.pluck(:pet_number)
    erb :market
  end

  post '/market' do
    pet_number = params[:pet_number].to_i
    price = PET_PRICES[pet_number]

    unless price
      @error = "Mascota inválida."
      @owned_pet_numbers = current_user.pets.pluck(:pet_number)
      return erb :market
    end

    if current_user.pets.exists?(pet_number: pet_number)
      @error = "Ya tenés esta mascota."
      @owned_pet_numbers = current_user.pets.pluck(:pet_number)
      return erb :market
    end

    if current_user.credits >= price
      current_user.pets.create(pet_number: pet_number)
      current_user.update(credits: current_user.credits - price)
      @owned_pet_numbers = current_user.pets.pluck(:pet_number)
      erb :market
    else
      @error = "No tenés créditos suficientes para comprar esta mascota."
      @owned_pet_numbers = current_user.pets.pluck(:pet_number)
      erb :market
    end
  end
end
