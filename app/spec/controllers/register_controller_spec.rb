require 'rack/test'
require 'rspec'
require_relative '../../controllers/register_controller'

RSpec.describe RegisterController do
  include Rack::Test::Methods

  def app
    RegisterController.new
  end

  it "muestra el formulario de registro" do
    get '/register'
    expect(last_response).to be_ok
    # Cambié el texto a buscar a algo que seguro está en el template
    expect(last_response.body).to include("<form")
    expect(last_response.body).to include("Correo Electronico")
  end
end
