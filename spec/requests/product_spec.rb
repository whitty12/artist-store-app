require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /product to: product#index" do
    before do
      #create an associated promotion
      @promotion = Promotion.create(
        promotion_description: "Half Off",
        discount_percent: 50.0,
      )
      #create an associated artist
      @creator = Creator.create(
        first_name: "Stephanie",
        last_name: "Test"
      )
      #create our products
      @product1 = Product.create(
          title: "Fancy Art",
          medium:"Writing",
          creator_id: @creator.id,
          description: "A fancy little story",
          price: 0.25,
          available: true
      )
      @product2 = Product.create(
          title: "Bad Writing",
          medium: "Art",
          product_id: @product2.id,
          description: "A bad story",
          price: 0.25,
          available: false
      )
    end
    
    it 'returns a page containing the list of products' do
      get '/products'
      expect(response.body).to include(@product1.title)
      expect(response.body).to include(@promotion.description)
      expect(response.body).to include(@product1.medium)
      expect(response.body).to include(@creator.full_name)
      expect(response.body).to include(@product1.description)
      expect(response.body).to include(@product1.price.to_s)
      expect(response.body).to include(@product1.available.to_s)

      expect(response.body).to include(@product2.title)
      expect(response.body).to include(@product2.medium)
      expect(response.body).to include(@creator.full_name)
      expect(response.body).to include(@product2.description)
      expect(response.body).to include(@product2.price.to_s)
      expect(response.body).to include(@product2.available.to_s)
    end

  end

  #this serves as an interconnected show page
  describe "GET /product/:id/product_details to: product_details#show" do
    before do

    @valid_product_params = {title: 'Story story', product_details_id: @product_details1.id}

    end

    it 'displays the product details for the product' do
      get '/products/1'
      expect(response.body).to include("Fancy Art")

    end

    it 'updates the product title and product detail id' do
      put '/products/2', params: @valid_product_params
    end
  end
end
