class LoginController < Sinatra::Base
  enable :sessions
  set :session_secret, 'a' *64

  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al login correctamente cuando centralize con el login_controller
  get '/login' do
    erb :login
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Usuario creado exitosamente'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  post '/login' do
    #user = User.find_by(name: params[:name], password: params[:password]) # volver a ponerlo cuando conecten la base de datos
    #if user
      #session[:user_id]=user.id
      #redirect '/menu'
      
    if params[:email] == "test@gmail.com" && params[:password] == "123"  #parchazo
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
