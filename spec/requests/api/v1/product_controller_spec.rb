require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
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
          available: true
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
 

  describe "GET /api/v1/products" do
    it "returns a list of products" do
      get '/api/v1/products'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['products']).to be_an(Array)
      expect(JSON.parse(response.body)['products'].size).to eq(1)
      expect(JSON.parse(response.body)['products'].first['id']).to eq(current_user.id)
    end
  end


  describe "GET /api/v1/products/:id" do
    it "returns a product" do
      get '/api/v1/products/:id'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['products']).to be_an(Array)
      expect(JSON.parse(response.body)['products'].size).to eq(1)
      expect(JSON.parse(response.body)['products'].first['id']).to eq(current_user.id)
    end
  end
end