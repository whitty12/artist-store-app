class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def edit 
  end

  def new
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)

      respond_to do |format|
          if @product.save
              format.html { redirect_to @product, notice: "Product was successfully created." }
              format.json { render :show, status: :created, location: @product }
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @product.errors, status: :unprocessable_entity }
          end
      end
  end

  # PATCH/PUT 
  def update
    respond_to do |format|            
        if @product.update(product_params)
            format.html { redirect_to @product, notice: "Product was successfully updated." }
            format.json { render :show, status: :ok, location: @product }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @product.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.expect(product: [:title, :description, :available, :medium, :creator_id, :promotion_id, :price])
  end
end