require 'rack/test'
require 'rspec'
require_relative '../../controllers/pets_controller'

RSpec.describe PetsController do
  include Rack::Test::Methods

  def app
    PetsController.new
  end

  before do
    pets_double = double("pets")
    allow(pets_double).to receive(:pluck).with(:pet_number).and_return([1, 2])
    allow(pets_double).to receive(:exists?).with(pet_number: 1).and_return(true)
    allow(pets_double).to receive(:exists?).with(pet_number: 3).and_return(false)

    fake_user = double("User", pets: pets_double, main_pet_number: 1, name: "Test User")

    allow_any_instance_of(PetsController).to receive(:current_user).and_return(fake_user)
  end

  it "muestra la lista de mascotas" do
    get '/pets'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Test User")
  end
end
