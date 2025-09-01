class ProductController < ApplicationController
  def index
    @products = Product.includes(:promotions, :product_type).all
  end

  def show
    @product = Product.includes(:promotions, :product_type).find(params[:id])
  end
end