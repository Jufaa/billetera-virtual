require 'sinatra/base'
require_relative '../models/user'
require_relative '../models/account'
require_relative '../models/pet'

class RegisterController < ApplicationController
  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al register correctamente cuando centralize con el register_controller
  get '/register' do
    erb :register
  end

  post '/register' do

    if params[:password] != params[:confirmP]
      @error_message = "Las contraseñas no coinciden"
      return erb :register
    end

    @user = User.new(
      name: params[:name],
      lastname: params[:lastname],
      dni: params[:dni],  
      birth_date: params[:birth_date],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password]
    )

    if @user.save
      @account = @user.create_account(
        cvu: "000000000000000#{@user.dni.to_s.rjust(4, '0')}",
        account_alias:"#{@user.name.downcase}.#{@user.lastname.downcase}.rupay",
        balance:"4000"
      )
      @user.update(credits: 1000)
      pet_number = [1, 2, 3].sample
      @user.pets.create(pet_number: pet_number)
      @user.update(main_pet_number: pet_number)
      redirect to('/login')
    else
      puts @user.errors.full_messages
      @error_message = "Error al registrar usuario"
      erb :register
    end
  end
end
