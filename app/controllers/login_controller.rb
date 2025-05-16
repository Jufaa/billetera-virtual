class LoginController < Sinatra::Base
  
  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al login correctamente cuando centralize con el login_controller
  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(name: params[:name], password: params[:password])
    if user
      session[:user_id]=user.id
      redirect '/menu'
    else
      @error_message = "Nombre de usuario o contraseña son incorrectas"
      erb :login
    end
  end

  get '/logout' do
    session.clear
    redirect to('/login')
  end
  
end