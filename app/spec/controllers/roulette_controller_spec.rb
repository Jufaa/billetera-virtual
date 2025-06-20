require 'rack/test'
require 'rspec'
require_relative '../../controllers/roulette_controller'

RSpec.describe RouletteController do
  include Rack::Test::Methods

  def app
    RouletteController.new
  end

  before do
    header 'Host', 'example.org'
    fake_user = double("User", credits: 100)
    allow_any_instance_of(RouletteController).to receive(:current_user).and_return(fake_user)
  end

  it "muestra la ruleta al cargar GET" do
    get '/roulette'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Ruleta")
  end

  it "procesa una jugada POST" do
    post '/roulette', premio_id: 0
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Ganaste|No tenés saldo suficiente|Error/)
  end
end
