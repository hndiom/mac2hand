# -*- encoding : utf-8 -*-
class BoardsController < ApplicationController

  before_filter :find_board, :except => [:index, :new, :create]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params[:board])

    if @board.save!
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def show
    @deals = @board.deals.all
  end

  def edit
    
  end

  def update
    if @board.update_attributes(params[:board])
      redirect_to board_path(@board), notice: 'board was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  protected

  def find_board
    @board = Board.find(params[:id])
  end
end
