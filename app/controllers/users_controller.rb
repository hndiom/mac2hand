# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required
  
  def edit
    @deals = current_user.deals.paginate(:page => params[:page], :per_page => 5)
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to account_path, :notice => "個人資料更新成功"
    else
      render :action => "profile"
    end
  end
end
