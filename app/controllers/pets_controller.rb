require_relative 'application_controller'
require_relative '../models/user'
require_relative '../models/account'
require_relative '../models/pet'

class PetsController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__)

  get '/pets' do
    @owned_pet_numbers = Pet.where(user_id: current_user.id).pluck(:pet_number)
    erb :pets
  end
  
  post '/pets' do
    pet_number = params[:pet_number].to_i
    Pet.update(user_id: current_user.id, pet_main: pet_number)
  end

end