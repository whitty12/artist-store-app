class CartItemsController < ApplicationController
  before_action :set_cart, :set_cart_item

  def new
    @cart_item.product_id
  end

  def create
    @cart_item = @cart.cart_items.new(cart_items_params)

     respond_to do |format|
          if @cart_item.save
              format.html { redirect_to products_path, notice: "Added to your cart!" }
              format.json { render :show, status: :created, location: @cart_item}
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @cart_item.errors, status: :unprocessable_entity }
          end
      end
  end

  def destroy
    @cart_item.destroy!
    redirect_to cart_path(@cart)
  end

  #Set the id of the cart
  def set_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = current_user.create_cart
    end
  end

  def set_cart_items
    @cart_items = @cart.cart_items.all
  end

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def cart_items_params
    params.require(:cart_item).permit(:product_id)
  end
end