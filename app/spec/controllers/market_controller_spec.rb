require 'rack/test'
require 'rspec'
require_relative '../../controllers/market_controller'

RSpec.describe MarketController do
  include Rack::Test::Methods

  def app
    MarketController.new
  end

  before do
    header 'Host', 'example.org'
    fake_user = double("User", pets: double(pluck: []), credits: 500)
    allow_any_instance_of(MarketController).to receive(:current_user).and_return(fake_user)
  end

  it "muestra el mercado" do
    get '/market'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Mercado")
  end
end
