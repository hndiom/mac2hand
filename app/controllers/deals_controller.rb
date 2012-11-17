class DealsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @deal = @board.deals.new
  end

  def create
    @board = Board.find(params[:board_id])
    @deal = @board.deals.new(params[:deal])
    @deal.user_id = current_user.id
    
    if @deal.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end
end
