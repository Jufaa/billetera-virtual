require_relative '../spec_helper'

describe 'TransferController' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'muestra el formulario de transferencia' do
    get '/transfer'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Transferir') # ajustá según tu HTML
  end
end
