# -*- encoding : utf-8 -*-
class DealsController < ApplicationController
  before_filter :find_board

  def new
    #@board = Board.find(params[:board_id])
    @deal = @board.deals.new
    @photo = @deal.photos.build
  end

  def create
    #@board = Board.find(params[:board_id])
    @deal = @board.deals.new(params[:deal])
    @deal.user_id = current_user.id
    
    if @deal.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def show
    @deal = @board.deals.find(params[:id])
  end

  protected

  def find_board
    @board = Board.find(params[:board_id])
  end
end
