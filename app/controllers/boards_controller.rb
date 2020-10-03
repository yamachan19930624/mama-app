class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board), notice: 'つぶやけた！'
    else
      flash.now[:error] = 'つぶやけなかった'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '変更したよ'
    else
      flash.now[:error] = '変更できなかったよ'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: 'つぶやきを消したよ'
  end



  private 
  def board_params
    params.require(:board).permit(:name, :description)
  end
  
end