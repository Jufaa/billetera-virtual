require 'rack/test'
require 'rspec'
require_relative '../../controllers/transfer_controller'

RSpec.describe TransferController do
  include Rack::Test::Methods

  def app
    TransferController.new
  end

  before do
    fake_user = double("User", name: "Test User")
    fake_account = double("Account", balance: 1000, transfers: [])

    allow_any_instance_of(TransferController).to receive(:current_user).and_return(fake_user)
    allow_any_instance_of(TransferController).to receive(:current_account).and_return(fake_account)
  end

  it "muestra el formulario de transferencia" do
    get '/transfer'
    puts "STATUS: #{last_response.status}"
    puts "BODY: #{last_response.body}"

    expect(last_response).to be_ok
    expect(last_response.body).to include("Transferir a una cuenta")
    expect(last_response.body).to include("Test User")
    expect(last_response.body).to include("1000")
  end
end
