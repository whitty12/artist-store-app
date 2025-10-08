class Api::V1::UsersController < ApplicationController

  def index

    @users = User.all
    #initialize variable before loop
    users_array = []
    
    @users.each do |user|
        users_array << user.attributes
    end

    users_hash = {users: users_array}
    
    render json: users_hash, status: :ok
  end

  def show
    @user = User.find(params[:id])
    
    render json: @user.attributes, status: :ok
  end

end