class LoginController < Sinatra::Base
  enable :sessions
  set :session_secret, 'a' *64
  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al login correctamente cuando centralize con el login_controller
  get '/login' do
    erb :login
  end

  post '/login' do
    #user = User.find_by(name: params[:name], password: params[:password])
    #if user
      #session[:user_id]=user.id
      #redirect '/menu'
      
    if params[:email] == "test@gmail.com" && params[:password] == "123"
      session[:user_id] = 1
      session[:user_name] = "Usuario de Prueba"
      redirect to('/main_menu')
    else
      @error_message = "Usuario o contraseña incorrectos"
      erb :login
    end
  end

  get '/logout' do
    session.clear
    redirect to('/login')
  end
  
end