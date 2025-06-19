require_relative 'application_controller'
require_relative '../models/user'
require_relative '../models/account'
require_relative '../models/pet'

class PetsController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/pets' do
  @owned_pet_numbers = current_user.pets.pluck(:pet_number)
  @main_pet_number = current_user.main_pet_number
  erb :pets
  end

  post '/pets' do
    pet_number = params[:pet_number].to_i

    if current_user.pets.exists?(pet_number: pet_number)
      current_user.update(main_pet_number: pet_number)
      redirect '/pets'
    else
      @error = "No posees esta mascota."
      @owned_pet_numbers = current_user.pets.pluck(:pet_number)
      erb :pets
    end
  end
end