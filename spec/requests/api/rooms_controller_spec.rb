require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  before { host! 'api.escamboo.test' }
  
  let!(:room_message) { create(:romm_message) }
  let(:headers) do
    {
      'Accept' => "application/vnd.escamboo",
      'Content-Type' => Mime[:json].to_s,
      'Authorization' => user.auth_token
    }
  end

  describe 'GET /likes' do
    before do
      create_list(:product, 5, user_id: user.id)
      post '/rooms', params: {}, headers: headers 
    end
  end
end
