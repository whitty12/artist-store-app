class PromotionController < ApplicationController
  def index
    @promotions = Promotion.all
  end
end