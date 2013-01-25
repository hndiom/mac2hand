# -*- encoding : utf-8 -*-
class WantsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @wants = Want.is_published.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @want = Want.new
    @user = current_user
    @categories = Category.all
  end

  def create
    @user = current_user
    @categories = Category.all
    @want = Want.new(params[:want])
    @want.user_id = current_user.id
    
    if @want.save
      redirect_to want_path(@want)
    else
      render :new
    end
  end

  def show
    @want = Want.find(params[:id])
    @comments = @want.comments

    set_page_title("#{@want.name}")
    set_page_description("只要 NTD #{@want.price}")
    # if @want.photos.present?
    #   set_page_image(Setting.domain+@want.photos.first.photo.to_s)
    # end
    session[:return_to] = want_path(@want)
  end

  def edit
    @user = current_user
    @categories = Category.all
    @want = Want.find(params[:id])
    unless @want.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @want = Want.find(params[:id])

    if @want.update_attributes(params[:want])
      redirect_to want_path(@want), :notice => "修改成功"
    else
      render :action => "edit"
    end
  end

  def publish
    @want = Want.find(params[:id])
    unless @want.user_id == current_user.id
      redirect_to root_path
    end
    @want.publish
    redirect_to "/account", :notice => "發佈成功"
  end

  def cancel_publish
    @want = Want.find(params[:id])
    unless @want.user_id == current_user.id
      redirect_to root_path
    end
    @want.cancel_publish
    redirect_to "/account", :notice => "已取消 #{@want.name}"
  end

  def destroy
    @want = Want.find(params[:id])
    @want.destroy
    redirect_to :back, :notice => "已刪除 #{@want.name}"
  end  
end
