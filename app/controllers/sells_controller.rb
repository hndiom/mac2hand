# -*- encoding : utf-8 -*-
class SellsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @sells = Sell.is_published.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @sell = Sell.new
    @user = current_user
    @categories = Category.all
  end

  def create
    @user = current_user
    @categories = Category.all
    @sell = Sell.new(params[:sell])
    @sell.user_id = current_user.id
    
    if @sell.save
      redirect_to new_sell_photo_path(@sell)
    else
      render :new
    end
  end

  def show
    @sell = Sell.find(params[:id])
    @comments = @sell.comments

    set_page_title("#{@sell.name}")
    set_page_description("只要 NTD #{@sell.price}")
    if @sell.photos.present?
      set_page_image(Setting.domain+@sell.photos.first.photo.to_s)
    end
    session[:return_to] = sell_path(@sell)
  end

  def edit
    @user = current_user
    @categories = Category.all
    @sell = Sell.find(params[:id])
    unless @sell.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @sell = Sell.find(params[:id])

    if @sell.update_attributes(params[:sell])
      redirect_to sell_path(@sell), :notice => "修改成功"
    else
      render :action => "edit"
    end
  end

  def publish
    @sell = Sell.find(params[:id])
    unless @sell.user_id == current_user.id
      redirect_to root_path
    end
    @sell.publish
    redirect_to "/account", :notice => "發佈成功"
  end

  def cancel_publish
    @sell = Sell.find(params[:id])
    unless @sell.user_id == current_user.id
      redirect_to root_path
    end
    @sell.cancel_publish
    redirect_to "/account", :notice => "已取消 #{@sell.name}"
  end

  def destroy
    @sell = Sell.find(params[:id])
    @sell.destroy
    redirect_to :back, :notice => "已刪除 #{@sell.name}"
  end
end
