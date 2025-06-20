ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require_relative '../../server'  # apunta correctamente a server.rb desde app/spec

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

# Este método le dice a Rack::Test qué app testear
def app
  Sinatra::Application  # o MyApp si tu clase principal hereda de Sinatra::Base con nombre
end
