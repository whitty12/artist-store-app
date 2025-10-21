require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  before do 
      @creator = Creator.create!(
        first_name: "Skylar",
        last_name: "Loving",
      )
      #create our products
      @product1 = Product.create!(
          title: "Fancy Art",
          medium:"Writing",
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

      #create user
      @user1 = User.create!(
        username: "username",
        password: "password",
        email: "testemail@com",
        first_name: "Stephanie",
        last_name: "Whitworth",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990"
      )
      @cart = Cart.create!(
        user_id: @user1.id
      )

      #create the items for our cart and associated products
      @cart_item1 = CartItem.create!(
        product_id: @product1.id,
        cart_id: @cart.id
      )

      @cart_item2 = CartItem.create!(
        product_id: @product2.id,
        cart_id: @cart.id
      )
    end

#test response for getting to cart page
  describe "GET /cart" do
    it "returns the cart page with the cart items" do

      #log in as user
      post '/login', params: { 
          username: "username", 
          password: 'password' 
      }

      get '/cart'
      expect(response).to have_http_status(:ok)
    end
    

    #make sure cart user id is associated
    #not the user/not logged in don't have access
  end
end