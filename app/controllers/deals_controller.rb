# -*- encoding : utf-8 -*-
class DealsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :get_deal_variables, :only => [:want, :sell, :create, :edit]
  before_filter :find_deal, :only => [:show, :edit, :update, :publish, :cancel_publish, :destroy]

  def index
    if params[:tag]
      @deals = Deal.tagged_with(params[:tag]).is_published.recent.paginate(:page => params[:page], :per_page => 25)
    else
      @deals = Deal.is_published.recent.paginate(:page => params[:page], :per_page => 25)
    end
  end

  def want
    @deal = Deal.new
  end

  def sell
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(params[:deal])
    @deal.user_id = current_user.id

    if @deal.save
      if @deal.type_of == "sell"
        redirect_to new_deal_photo_path(@deal)
      elsif @deal.type_of == "want"
        redirect_to deal_path(@deal)
      end
    else
      case params[:deal][:type_of]
      when "sell"
        render :sell
      when "want"
        render :want
      end 
    end
  end

  def show
    @comments = @deal.comments

    if @deal.type_of == "sell"
      set_page_title("我正在出售 #{@deal.name}")
      set_page_description("#{@deal.spec} 只要 NTD #{@deal.price}")
    elsif @deal.type_of == "want"
      set_page_title("我想要買 #{@deal.name}")
      set_page_description("詳情請點進來看喔!")
    end
    if @deal.photos.present?
      set_page_image(Setting.domain+@deal.photos.first.photo.to_s)
    end
    session[:return_to] = deal_path(@deal)
  end

  def edit
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @cities = City.all
    @dists = Dist.all
    
    if @deal.update_attributes(params[:deal])
      redirect_to deal_path(@deal), :notice => "修改成功"
    else
      render :action => "edit"
    end
  end

  def publish
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
    @deal.publish
    redirect_to "/account", :notice => "發佈成功"
  end

  def cancel_publish
    unless @deal.user_id == current_user.id
      redirect_to root_path
    end
    @deal.cancel_publish
    redirect_to "/account", :notice => "已取消 #{@deal.name}"
  end

  def destroy
    @deal.destroy
    redirect_to :back, :notice => "已刪除 #{@deal.name}"
  end

  protected

  def get_deal_variables
    @user = current_user
    @cities = City.all
    @dists = Dist.all
    @categories = Category.all
  end

  def find_deal
    @deal = Deal.find(params[:id])
  end
end
