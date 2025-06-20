require 'rack/test'
require 'rspec'
require_relative '../../controllers/change_user_data_controller'

RSpec.describe ChangeUserDataController do
  include Rack::Test::Methods

  def app
    ChangeUserDataController.new
  end

  before do
    header 'Host', 'example.org'
  end

  it "muestra la pantalla de cambio de datos del usuario" do
    get '/change_user_data'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Cambiar datos")
  end
end
