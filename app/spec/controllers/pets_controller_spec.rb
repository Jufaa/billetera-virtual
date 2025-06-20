require 'rack/test'
require 'rspec'
require_relative '../../controllers/pets_controller'

RSpec.describe PetsController do
  include Rack::Test::Methods

  def app
    PetsController.new
  end

  before do
    header 'Host', 'example.org'
    fake_user = double("User", pets: double(pluck: []), main_pet_number: nil)
    allow_any_instance_of(PetsController).to receive(:current_user).and_return(fake_user)
  end

  it "muestra la lista de mascotas" do
    get '/pets'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Mascotas")
  end
end
