require 'rack/test'
require 'rspec'
require_relative '../../controllers/register_controller'

RSpec.describe RegisterController do
  include Rack::Test::Methods

  def app
    RegisterController.new
  end

  before do
    header 'Host', 'example.org'
  end

  it "muestra el formulario de registro" do
    get '/register'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Registrarse")
  end
end
