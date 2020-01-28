require 'rails_helper'
 
 RSpec.describe 'Exchanges', type: :request do
  
  describe 'GET #index' do

    before { Stubs.request_currency }

    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end