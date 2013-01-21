# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.all { 
          head(:unauthorized)
        }
      end
    end
  end

  def after_sign_in_path_for(resource)
    if session[:return_to]
      session[:return_to]
    else
      root_path
    end
  end
end
