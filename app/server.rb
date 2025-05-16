
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'logger'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require './controllers/login_controller' #para usar los controllers
require './controllers/register_controller' #para usar los controllers

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

  use LoginController
  use RegisterController

  get '/' do
    redirect '/login'
  end

  
  get '/logout' do
    session.clear
    redirect '/login'
  end
    
end
