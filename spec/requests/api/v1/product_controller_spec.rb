require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  before do
    @creator = Creator.create(
        first_name: "Skylar",
        last_name: "Loving",
    )
    @promotion1 = Promotion.create(
        promotion_description: "Half Off",
        discount_percent: 50.0,
    )
    # Set up the products
    @product1 = Product.create(
            title: "Fancy Art",
            medium:"Writing",
            creator_id: @creator.id,
            description: "A fancy little story",
            price: 0.25,
            available: true,
            promotion_id: @promotion1.id
    )
    @product2 = Product.create(
            title: "Bad Writing",
            medium: "Art",
            creator_id: @creator.id,
            description: "A bad story",
            price: 0.25,
            available: false
    )

    #log in as user
      post '/api/v1/login', params: { 
        username: "username2", 
        password: 'password2' 
      }
  end

  describe "GET /api/v1/products" do
    it "returns a list of products" do
      
      get '/api/v1/products'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['products']).to be_an(Array)
      expect(JSON.parse(response.body)['products'].size).to eq(8)
    end
  end


  describe "GET /api/v1/products/:id" do
    it "returns a product" do

      get "/api/v1/products/1"

      expect(response).to have_http_status(:ok)

      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(parsed_body['id']).to eq(1)
      expect(parsed_body['title']).to eq("Fancy Art")
    end
  end
end