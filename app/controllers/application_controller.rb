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

end
