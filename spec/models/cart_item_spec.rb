require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it 'has a product id and a cart id' do
    user = User.create(
        username: "default_user",
        password: "password",
        email: "testemail@com",
        first_name: "Steph",
        last_name: "W",
        address: "test address",
        zipcode: "00000",
        state: "CO",
        sex: "F",
        birthday: "January 1, 1990",
    )
    creator = Creator.create(
      first_name: 'Stephen', 
      last_name: 'King'
    )
    cart = Cart.create(
      user_id: user.id
    )
    product = Product.create(
        title: 'Test Title',
        medium:"Writing",
        creator_id: creator.id,
        description: "A fancy little story",
        price: 0.25,
        available: true
      )
    item1 = CartItem.create(
      product_id: product.id,
      cart_id: cart.id
    )

    invalid_cart = CartItem.create(
      product_id: product.id,
      cart_id: nil
    )

    invalid_product = CartItem.create(
      product_id: nil,
      cart_id: cart.id
    )

    #valid item is created
    expect(item1.product.title).to eq("Test Title")
    expect(item1.cart_id).to eq(cart.id)

    #invalid cart id
    expect(invalid_cart).not_to be_valid

    #invalid product id
    expect(invalid_product).not_to be_valid

  end

end
