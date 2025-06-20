require 'rack/test'
require 'rspec'
require_relative '../../controllers/transfer_controller'
RSpec.describe TransferController do
  include Rack::Test::Methods

  def app
    TransferController.new
  end

  it "muestra el formulario de transferencia" do
    get '/transfer'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Formulario") # Ajustar según el contenido real
  end
end
