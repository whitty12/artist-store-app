class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all
    
    #initialize variable before loop
    products_array = []
    
    @products.each do |product|
        products_array << product.attributes
    end

    products_hash = {products: products_array}
    
    render json: products_hash, status: :ok
  end

  def show
    @product = Product.find(params[:id])
    
    render json: @product.attributes, status: :ok
  end

  def set_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = current_user.create_cart
    end
  end

end