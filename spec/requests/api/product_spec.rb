require 'rails_helper'

RSpec.describe 'Task API' do
  before { host! 'api.escamboo.test' }
  
  let!(:user) { create(:user) }
  let(:headers) do
    {
      'Accept' => "application/vnd.escamboo",
      'Content-Type' => Mime[:json].to_s,
      'Authorization' => user.auth_token
    }
  end

  describe 'GET /products' do
    before do
      create_list(:product, 5, user_id: user.id)
      get '/products', params: {}, headers: headers
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 5 tasks from database' do
      expect(json_body[:products].count).to eq(5)
    end
  end

end