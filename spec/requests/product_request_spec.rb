require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /search' do
    it 'returns http success' do
      get '/product/search'
      expect(response).to have_http_status(:success)
    end
  end
end
