class CartsController < ApplicationController
  before_action :set_cart

  #show our one cart belonging to the user
  def show
    @cart = current_user.cart
    @cart_items = @cart.cart_items
  end

  def set_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = current_user.create_cart
    end
  end
  

end