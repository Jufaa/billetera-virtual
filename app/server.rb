
require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'logger'
require 'sinatra/reloader' if Sinatra::Base.environment == :development

class App < Sinatra::Application
  set :root, File.dirname(__FILE__)
  set :database_file, File.join(settings.root, 'config', 'database.yml')

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
    'Welcome'
  end
end
