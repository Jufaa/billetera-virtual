require 'sinatra/base'
require_relative '../models/user'

class ApplicationController < Sinatra::Base
  enable :sessions
  set :session_secret, 'a' * 64

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    def current_account
      @current_account ||= Account.find_by(id: session[:user_id])
    end
    def all_transfers
    return [] unless current_account
    @all_transfers ||= Transfer.where(account_id: current_account.id)
    end
  end
  configure :test do
  disable :protection
  end
end
