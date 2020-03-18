require 'rails_helper'

RSpec.describe "UserProducts API", type: :request do
  let(:headers) do
    {
      "Accept" => "application/vnd.escamboo",
      'Content-Type' => Mime[:json].to_s
    }
  end

  describe 'GET /usersproducts' do
    before do
      get '/usersproducts', params: {}, headers: headers
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a key of all' do
      expect(json_body).to have_key(:all)
    end
  end

end
