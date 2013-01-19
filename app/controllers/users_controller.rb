# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def edit
    @deals = current_user.deals.paginate(:page => params[:page], :per_page => 5)
  end
end
