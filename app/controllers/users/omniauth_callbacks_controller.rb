# -*- encoding : utf-8 -*-
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(*providers)
    providers.each do |provider|
      class_eval %Q{
        def #{provider}
          if not current_user.blank?
            current_user.bind_service(env["omniauth.auth"])#Add an auth to existing
            redirect_to edit_user_registration_path, :notice => "成功绑定了 #{provider} 帐号。"
          else
            @user = User.find_or_create_for_#{provider}(env["omniauth.auth"])

            if @user.persisted?
              # if @user.has_cellphone?
                flash[:notice] = "成功使用 #{provider.to_s.titleize} 登入."
                sign_in_and_redirect @user, :event => :authentication, :notice => "登入成功."
              # else
              #   flash[:notice] = "成功使用 #{provider.to_s.titleize} 登入, 請確認您的聯絡方式無誤"
              #   sign_in @user
              #   redirect_to "/account/profile"
              # end
            else
              redirect_to new_user_registration_url
            end
          end
        end
      }
    end
  end

  provides_callback_for :facebook

  # This is solution for existing accout want bind Google login but current_user is always nil
  # https://github.com/intridea/omniauth/issues/185
  def handle_unverified_request
    true
  end

end
