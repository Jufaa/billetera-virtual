require 'rack/test'
require 'rspec'
require_relative '../../controllers/main_menu_controller'

RSpec.describe MainMenuController do
  include Rack::Test::Methods

  def app
    MainMenuController.new
  end

  before do
    header 'Host', 'example.org'
    allow_any_instance_of(MainMenuController).to receive(:all_transfers).and_return([])
  end

  it "muestra el menú principal" do
    get '/main_menu'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Menú Principal")
  end
end
