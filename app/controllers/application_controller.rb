require 'sinatra/base'
require_relative '../models/user'

class ApplicationController < Sinatra::Base
  enable :sessions
  set :session_secret, 'a' * 64

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
