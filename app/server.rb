require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'logger'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require './controllers/login_controller' #para usar los controllers
require './controllers/register_controller' #para usar los controllers
require './controllers/main_menu_controller' #para usar los controllers
require './controllers/my_profile_controller'
require './controllers/change_user_data_controller'
require_relative './controllers/transfer_controller'
require './controllers/transfer_failed_controller'
require './controllers/transfer_success_controller'
require './controllers/change_account_data_controller'
require './controllers/market_controller'
require './controllers/not_yet_controller'
require './controllers/pets_controller'
require './controllers/roulette_controller'

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
  use ChangeUserDataController
  use ChangeAccountDataController
  use RouletteController

  get '/' do
    redirect '/login'
  end




end
