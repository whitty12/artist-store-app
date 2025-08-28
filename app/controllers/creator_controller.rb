class CreatorController < ApplicationController
  def index
    @creators = Creator.all
  end
  
  def show
  end
end