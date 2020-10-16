class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    board = Board.find(params[:board_id])
    board.likes.create!(user_id: current_user.id)
    redirect_to board_path(board)
  end

  def destroy
    board = Board.find(params[:board_id])
    like =  board.likes.find_by!(user_id: current_user.id)
    like.destroy!
    redirect_to board_path(board)
  end
end