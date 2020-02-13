require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  describe "GET /users/:id" do
    before do
      headers = { "Accept" => "application/vnd.escamboo" }
      get "/users/#{user_id}", params: {}, headers: headers 
    end

    context 'When the user exists' do
      it "returns the user" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:id]).to eq(user_id)
      end
    end
  end


end