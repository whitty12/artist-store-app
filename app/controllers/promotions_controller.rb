class PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def edit
  end

  def new
    @promotion = Promotion.new
  end

  def create
      @promotion = Promotion.new(promotion_params)

      respond_to do |format|
          if @promotion.save
              format.html { redirect_to @promotion, notice: "Promotion was successfully created." }
              format.json { render :show, status: :created, location: @promotion }
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @promotion.errors, status: :unprocessable_entity }
          end
      end
  end

  def update
    respond_to do |format|
         #check if description blank
        #if params[:promotion_description].blank?
        #  format.html {render :edit, status: :bad_request}
        #  format.json {render json: @promotion.errors, status: :bad_request}
        #end

        #if params[:discount_percent].blank?
        #  format.html {render :edit, status: :bad_request}
        #  format.json {render json: @promotion.errors, status: :bad_request}
        #end
            
        if @promotion.update(promotion_params)
            format.html { redirect_to @promotion, notice: "Promotion was successfully updated." }
            format.json { render :show, status: :ok, location: @promotion }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @promotion.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @promotion.destroy

    redirect_to promotions_path
  end

  private
  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params.expect(promotion: [:promotion_description, :discount_percent, :product_id])
  end

end