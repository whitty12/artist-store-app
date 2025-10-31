class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[index destroy ]

  def index
    @users = User.all
  end

  def show
    if current_user!= @user
      redirect_to products_path
    end
  end

  def new
    @user = User.new
    @user.build_cart
  end

  def edit
  end

  def create
      @user = User.new(user_params)

      respond_to do |format|
          if @user.save
              @user.create_cart
              format.html { redirect_to root_path, notice: "User was successfully created." }
              format.json { render :show, status: :created, location: @user}
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
  end

  def update
    respond_to do |format|
         #check if description blank
        if params[:username].blank?
          format.html {render :edit, status: :bad_request}
          format.json {render json: @user.errors, status: :bad_request}
        end

        if params[:password].blank?
          format.html {render :edit, status: :bad_request}
          format.json {render json: @user.errors, status: :bad_request}
        end
            
        if @user.update(user_params)
            format.html { redirect_to @user, notice: "User was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end
  
  def destroy
    @user.destroy

    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(user: [ :first_name, :last_name, :username, :password, :email, :address,:zipcode,:state,:sex,:birthday])
  end
end