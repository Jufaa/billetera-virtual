require 'rack/test'
require 'rspec'
require_relative '../../controllers/my_profile_controller'

RSpec.describe MyProfileController do
  include Rack::Test::Methods

  def app
    MyProfileController.new
  end

  before do
    header 'Host', 'example.org'
  end

  it "muestra el perfil del usuario" do
    get '/my_profile'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Mi Perfil")
  end
end
