class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_login?
    if current_user.blank?
      false
    else
      true
    end
  end
end
