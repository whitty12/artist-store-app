class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:username])

        if user
            if user.authenticate(params[:password])
            #success
                session[:user_id] = user.id
                session[:role] = user.role
                redirect_to products_path
            else
                flash.now[:alert] = 'Invalid username or password.'
                render :new
            end
        else
            flash.now[:alert] = 'Invalid username or password.'
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to products_path
    end
end