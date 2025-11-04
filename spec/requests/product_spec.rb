require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /product to: product#index" do
    before do

      #create an associated promotion
      @promotion = Promotion.create!(
        promotion_description: "Half Off",
        discount_percent: 50.0,
      )
      #create an associated artist
      @creator = Creator.create!(
        first_name: "Stephanie",
        last_name: "Test"
      )
      #create our products
      @product1 = Product.create!(
          title: "Fancy Art",
          medium:"Writing",
          promotion_id: @promotion.id,
          creator_id: @creator.id,
          description: "A fancy little story",
          price: 0.25,
          available: true
      )
      @product2 = Product.create!(
          title: "Bad Writing",
          medium: "Art",
          creator_id: @creator.id,
          description: "A bad story",
          price: 0.25,
          available: false
      )
    end
    
    it 'returns a page containing the list of products' do
      get '/products'
      expect(response.body).to include(@product1.title)
      expect(response.body).to include(@promotion.promotion_description)
      expect(response.body).to include(@product1.medium)

      expect(response.body).to include(@product2.title)
      expect(response.body).to include(@product2.medium)
    end

  end

  #this serves as an interconnected show page
  describe "GET /product/:id to: products#show" do
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
          promotion_id: @promotion.id,
          creator_id: @creator.id,
          description: "A fancy little story",
          price: 0.25,
          available: true
      )
      @product2 = Product.create(
          title: "Bad Writing",
          medium: "Art",
          creator_id: @creator.id,
          description: "A bad story",
          price: 0.25,
          available: false
      )
    end

    let!(:admin_user) {
      User.create(
        username: "Admin_User",
        password: "password",
        cart_id: 1,
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990",
        role: 'admin'
      )
    }

    it 'displays the product details for the product' do
      
      #log in as user
      post '/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }

      get "/products/#{@product1.id}"

      expect(response.body).to include("Fancy Art")
      expect(response.body).to include("Stephanie Test") 
      expect(response.body).to include(@product1.price.to_s)
      expect(response.body).to include("Available: Yes")
      expect(response.body).to include(@product1.description)

    end

    it 'updates the product' do
      post '/login', params: { 
        username: "Admin_User", 
        password: 'password' 
      }
      put "/products/#{@product2.id}", params: { 
        product: { 
          title: 'Story story' 
        }
      }

      follow_redirect!
      @product2.reload
      expect(@product2.title).to eq('Story story')

    end
  end
end
