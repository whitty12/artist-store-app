class CreatorsController < ApplicationController
  before_action :set_creator, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]

  def index
    @creators = Creator.all
  end
  
  def show
    @creator = Creator.find(params[:id])
  end

  def new
    @creator = Creator.new
  end

  def edit
  end

  def create
      @creator = Creator.new(creator_params)

      respond_to do |format|
          if @creator.save
              format.html { redirect_to @creator, notice: "Artist was successfully created." }
              format.json { render :show, status: :created, location: @creator}
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @creator.errors, status: :unprocessable_entity }
          end
      end
  end

  # PATCH/PUT 
  def update
    respond_to do |format|
        #check if first name blank
        if params[:first_name].blank?
            format.html {render :edit, status: :bad_request}
            format.json {render json: @creator.errors, status: :bad_request}
        end
            
        if @creator.update(creator_params)
            format.html { redirect_to @creator, notice: "Artist was successfully updated." }
            format.json { render :show, status: :ok, location: @creator }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @creator.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @creator.destroy

    redirect_to creators_path, notice: "Artist was successfully deleted."
  end

  private
  def set_creator
    @creator = Creator.find(params[:id])
  end

  def creator_params
    params.expect(creator: [ :first_name, :last_name])
  end
end