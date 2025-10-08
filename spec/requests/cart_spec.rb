require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "get users/:id/cart to: cart#index" do
    before do 
      #create the product type
      @product_type = ProductType.create(
        medium:"Writing",
        artstyle: "Short Story"
      )
      #create our products
      @product1 = Product.create(
          title: "Fancy Art",
          product_type_id:@product_type.id,
      )
      @product2 = Product.create(
          title: "Bad Writing",
          product_type_id:@product_type.id,
      )
      #create the details for each product
      @product_details1 = ProductDetail.create(
        product_id: @product1.id,
        description: "A fancy little story",
        price: 0.25,
        in_stock: 2
      )
      @product_details2 = ProductDetail.create(
        product_id: @product2.id,
        description: "A bad story",
        price: 0.25,
        in_stock: 2
      )

      #update products with ids
      @product1.update(product_details_id: @product_details1.id)
      @product2.update(product_details_id: @product_details2.id)

      #create user
      @user1 = User.create(
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
      @cart = Cart.create(
        user_id: @user1.id
      )

      #create the items for our cart and associated products
      @cart_item1 = CartItem.create(
        product_id: @product1.id,
        cart_id: @cart.id
      )

      @cart_item2 = CartItem.create(
        product_id: @product2.id,
        cart_id: @cart.id
      )

      @user1.update(cart_id:@cart_id)
    end

    it 'should load a page of all the cart items' do
      get "/users/#{@user1.id}/cart"
      expect(response.body).to include(@product1.title)
      expect(response.body).to include(@product2.title)
    end
  end
end
