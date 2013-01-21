# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  before_filter :find_deal

  def new
    @comment = @deal.comments.new
  end

  def create
    @comment = @deal.comments.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to deal_path(@deal)
    else
      redirect_to deal_path(@deal), :alert => "抱歉, 目前無法留言, 請稍候再試, 謝謝."
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  protected

  def find_deal
    @deal = Deal.find(params[:deal_id])
  end
end
