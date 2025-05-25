
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'logger'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require './controllers/login_controller' #para usar los controllers
require './controllers/register_controller' #para usar los controllers
require './controllers/main_menu_controller' #para usar los controllers
require './controllers/my_profile_controller'
require_relative './controllers/transfer_controller'
require './controllers/transfer_failed_controller'
require './controllers/transfer_success_controller'

class App < Sinatra::Application
  set :root, File.dirname(__FILE__)
  set :database_file, File.join(settings.root, 'config', 'database.yml')
  enable :sessions
   set :session_secret, 'a' *64

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
  use MainMenuController
  use MyProfileController
  use TransferController
  use TransferSuccessController
  use TransferFailedController

  get '/' do
    redirect '/login'
  end




end
