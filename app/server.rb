
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'logger'
require 'sinatra/reloader' if Sinatra::Base.environment == :development

class App < Sinatra::Application
  set :root, File.dirname(__FILE__)
  set :database_file, File.join(settings.root, 'config', 'database.yml')
  enable :sessions
  configure :development do
    enable :logging
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG
    set :logger, logger
    

    register Sinatra::Reloader
    after_reload do
      logger.info 'Reloaded!!!'
    end
  end

  get '/' do
    redirect '/login'
  end

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

  get '/resgistro' do
    erb :registro
  end 

  post '/resgistro' do
    user = User.find_by(mail: params[:mail]) || User.find_by(name: params[:name])
    if user
      @error_message = "Usted ya tenia una cuenta previa"
      erb :login
    else
      user = User.new(name: params[:name], mail: params[:mail], password: params[:password])
      if user.save
        session[:user_id]= user.id
        redirect '/login'
      else
        @error_message = "Error al crear la cuenta"
        erb :registro
      end
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/login'
  end
    
end
