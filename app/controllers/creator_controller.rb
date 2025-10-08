class CreatorController < ApplicationController
  def index
    @creators = Creator.all
  end
  
  def show
    @creator = Creator.find(params[:id])
  end
end