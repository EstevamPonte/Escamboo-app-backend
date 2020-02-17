require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }

  let (:headers) do 
    {
      "Accept" => "application/vnd.escamboo"
    }
  end

  describe "GET /users/:id" do
    before do
      get "/users/#{user_id}", params: {}, headers: headers 
    end

    context 'When the user exists' do
      it 'returns the user' do
        expect(json_body[:id]).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    
    context 'When the user dont exists' do
      let(:user_id) { 1000000 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /users' do
    before do
        post '/users', params: { user: user_params }, headers: headers
    end

    context 'when the request params are valid' do
      let(:user_params) { attributes_for(:user) } # FactoryGirl.attributes_for(:user) ou attributes_for(:user)

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'return json data for created user' do  
        expect(json_body[:email]).to eq(user_params[:email])
      end
    end

    context 'when the request params are invalid' do
      let(:user_params) { attributes_for(:user, email: 'invalid_email@') }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns the json data for the erros' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe 'PUT /users/:id' do
    before do
      put "/users/#{user_id}", params: { user: user_params }, headers: headers
    end

    context 'when the request params are valid' do
      let(:user_params) { { email: 'new_email@escamboo.com' } }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json data for the update user' do
        expect(json_body[:email]).to eq(user_params[:email])
      end
    end

    context 'when the request params are invalid' do
      let(:user_params) { { email: 'invalid_new_email@' } }
      
      it 'returns status code 200' do
        expect(response).to have_http_status(422)
      end

      it 'returns the json data for the update user' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe 'DELETE /users/:id' do
    before do
      delete "/users/#{user_id}", params: {}, headers: headers
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'remove the user from database' do
      expect( User.find_by( id: user.id ) ).to be_nil
    end
  end


end