require 'rails_helper'

RSpec.describe 'Likes API' do
  before { host! 'api.escamboo.test' }
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }

  let(:headers) do
    {
      'Accept' => "application/vnd.escamboo",
      'Content-Type' => Mime[:json].to_s,
      'Authorization' => user.auth_token
    }
  end

  describe 'GET /likes' do
    before do
      get '/likes', params: {}, headers: headers 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /likes' do
    before do
      create_list(:product, 5, user_id: user.id)
      post '/likes', params: {like: like_params}.to_json, headers: headers 
    end

    context 'When the params are valid' do
      let(:like_params) { attributes_for(:like) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      # it 'saves the likes in the database' do
      #   expect( Like.find(like_params[:product]) ).not_to be_nil
      # end
    end
  end
end