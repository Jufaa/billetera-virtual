require 'rack/test'
require 'rspec'
require_relative '../../controllers/change_account_data_controller'

RSpec.describe ChangeAccountDataController do
  include Rack::Test::Methods

  def app
    ChangeAccountDataController.new
  end

  before do
    header 'Host', 'example.org'
  end

  it "muestra la pantalla de cambio de datos de la cuenta" do
    get '/change_account_data'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Cambiar datos de la cuenta")
  end
end
