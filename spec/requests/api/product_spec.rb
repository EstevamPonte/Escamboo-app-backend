require 'rails_helper'

RSpec.describe 'Product API' do
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

    it 'returns 5 product from database' do
      expect(json_body[:products].count).to eq(5)
    end
  end

  describe 'GET /products/:id' do
    let(:product) { create(:product, user_id: user.id) }

    before { get "/products/#{product.id}", params: {}, headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
    
    it 'returns the json for product' do
      expect(json_body[:name]).to eq(product.name)
    end
  end

  describe 'POST /products' do
    before do
      post '/products', params: {product: product_params}.to_json, headers: headers
    end

    context 'when the params are valid' do
      let(:product_params) { attributes_for(:product) }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'saves the product in the database' do
        expect( Product.find_by(name: product_params[:name]) ).not_to be_nil
      end

      it 'returns the json for created product' do
        expect( json_body[:name] ).to eq(product_params[:name])
      end

      it 'assigns the created product to the corrent_user' do
        expect(json_body[:user_id]).to eq(user.id)
      end
    end

    context 'When the params are invalid' do
      let(:product_params) { attributes_for(:product, name: ' ') }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'does note save the product in the database' do
        expect( Product.find_by(name: product_params[:name]) ).to be_nil
      end

      it 'returns the json error for name' do
        expect(json_body[:errors]).to have_key(:name)
      end
    end
  end

  describe 'PUT /products/:id' do
    let!(:product) { create(:product, user_id: user.id) }

    before do
      put "/products/#{product.id}", params: { product: product_params }.to_json, headers: headers
    end

    context 'When the params are valid' do
      let(:product_params){ {name: 'new product name'} }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json for updated product' do
        expect(json_body[:name]).to eq(product_params[:name])
      end

      it 'update the product in the database' do
        expect( Product.find_by(name: product_params[:name]) ).not_to be_nil
      end
    end

    context 'When the params are invalid' do
      let(:product_params) { { name: ' ' } }

      it 'return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns the json error for name' do
        expect(json_body[:errors]).to have_key(:name)
      end

      it 'does not update the product in the database' do
        expect( Product.find_by(name: product_params[:name]) ).to be_nil
      end
    end
  end

  describe 'DELETE /product/:id' do
    let!(:product) { create(:product, user_id: user.id) }

    before do
      delete "/products/#{product.id}", params: {}, headers: headers
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'remove the task from the databese' do
      expect { Product.find(product.id) }.to raise_error(ActiveRecord::RecordNotFound) 
    end
  end

end