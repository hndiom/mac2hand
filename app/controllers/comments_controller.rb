# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController

  before_filter :login_required

  def new
    @comment = Comment.new
  end

  def create
    
    case params[:comment][:type_of]
      when "sell"
        @sell = Sell.find(params[:sell_id])
        @comment = @sell.comments.new(params[:comment])
      when "want"
        @want = Want.find(params[:want_id])
        @comment = @want.comments.new(params[:comment])
    end

    @comment.user_id = current_user.id 

    if @comment.save
      redirect_to :back, :notice => "已留言, 謝謝."
    else
      redirect_to :back, :alert => "抱歉, 目前無法留言, 請稍候再試, 謝謝."
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
