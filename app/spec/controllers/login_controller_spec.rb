require 'rack/test'
require 'rspec'
require_relative '../../controllers/login_controller'

RSpec.describe LoginController do
  include Rack::Test::Methods

  def app
    LoginController.new
  end

  before do
    header 'Host', 'example.org'
  end

  it "muestra el formulario de login" do
    get '/login'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Login")
  end
end
