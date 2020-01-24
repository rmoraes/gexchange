require 'rails_helper'
 
 RSpec.describe 'Exchanges', type: :request do
  
  let(:amount){ rand(1..9999) }

  describe 'GET #index' do
    it 'returns http success' do
      get root_path
      
      expect(response).to have_http_status(200)
    end
  end
 
  describe 'GET #convert' do
    it 'returns http success' do
      get convert_path(params: { amount: amount, from: 'USD', to: 'BRL' })

      expect(response).to have_http_status(200)
    end
  end
end