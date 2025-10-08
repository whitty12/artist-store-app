class Api::V1::CreatorsController < ApplicationController

  def index
    @creators = Creator.all
    
    #initialize variable before loop
    creators_array = []
    
    @creators.each do |creator|
        creators_array << creator.attributes
    end

    creators_hash = {creators: creators_array}
    
    render json: creators_hash, status: :ok
  end

  def show
    @creator = Creator.find(params[:id])
    
    render json: @creator.attributes, status: :ok
  end
end