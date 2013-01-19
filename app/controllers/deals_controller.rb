# -*- encoding : utf-8 -*-
class DealsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @deals = Deal.is_published.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = current_user
    @deal = Deal.new
    @categories = Category.all
  end

  def create
    @deal = Deal.new(params[:deal])
    @deal.user_id = current_user.id
    
    if @deal.save
      redirect_to new_deal_photo_path(@deal)
    else
      render :new
    end
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def edit
    @user = current_user
    @categories = Category.all
    @deal = Deal.find(params[:id])
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @deal = Deal.find(params[:id])

    if @deal.update_attributes(params[:deal])
      redirect_to deal_path(@deal), :notice => "修改成功"
    else
      render :action => "edit"
    end
  end

  def publish
    @deal = Deal.find(params[:id])
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
    @deal.publish
    redirect_to "/account", :notice => "發佈成功"
  end

  def cancel_publish
    @deal = Deal.find(params[:id])
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
    @deal.cancel_publish
    redirect_to "/account", :notice => "已取消 #{@deal.name}"
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to :back, :notice => "已刪除 #{@deal.name}"
  end
end
