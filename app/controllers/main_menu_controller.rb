class MainMenuController < Sinatra::Base
  enable :sessions
  set :session_secret, 'a' *64 # Para que coincidan las claves de session entre los controllers dsp hay que ponerlo para que sea al azar(minimo 64 caracteres)
  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al mainMenu correctamente cuando centralize con el mainMenu_controller

  get '/main_menu' do
    @user_name = session[:user_name] || "Usuario de Prueba"
    erb :main_menu
  end
end