class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  def require_admin
    if session[:role] != 'admin'
      flash[:alert] = 'You do not have access to that page.'
      redirect_to products_path
    end
  end

  def require_basic_user
    if session[:role] != 'basic user'
      flash[:alert] = 'You do not have access to that page.'
      redirect_to products_path
    end
  end

  #Note: Creator role is currently excluded. This is defined in case it is needed in the future.
  def require_creator
    if session[:role] != 'creator'
      flash[:alert] = 'You do not have access to that page.'
      redirect_to products_path
    end
  end

  #set current user
  def current_user
    @current_user ||= User.find_by_id!(session[:user_id])
  end

end
