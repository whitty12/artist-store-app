class Api::V1::PromotionsController < ApplicationController

  def index
    @promotions = Promotion.all
    
    #initialize variable before loop
    promotions_array = []
    
    @promotions.each do |promotion|
        promotions_array << promotion.attributes
    end

    promotions_hash = {promotions: promotions_array}
    
    render json: promotions_hash, status: :ok
  end

  def show
    @promotion = Promotion.find(params[:id])
    
    render json: @promotion.attributes, status: :ok
  end
end