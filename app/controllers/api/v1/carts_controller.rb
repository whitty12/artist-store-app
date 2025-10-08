class Api::V1::CartsController < ApplicationController

  def show
    render json: @cart.attributes, status: :ok
  end
end