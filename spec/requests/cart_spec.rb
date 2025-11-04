require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "get users/:id/cart to: cart#index" do
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

    it 'should load a page of all the cart items' do
      post '/login', params: { 
        username: "username", 
        password: 'password' 
      }
      get "/cart"
      expect(response.body).to include(@product1.title)
      expect(response.body).to include(@product2.title)
    end
  end
end
