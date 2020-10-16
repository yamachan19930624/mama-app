class CommentsController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @comment = board.comments.build
  end

  def create
    board = Board.find(params[:board_id])
    @comment = board.comments.build(comment_params)
    if @comment.save
      redirect_to board_path(board), notice: 'コメントしたよ'
    else
      flash.now[:error] = 'コメントできなかった'
      render :new
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:description)
  end
end