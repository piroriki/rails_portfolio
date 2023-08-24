class BathController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @bath = Bath.update
    
    if @bath.update
      redirect_to baths_path, notice: '更新完了しました'
    else
      render: edit, status: :unprocessable_entity
    end
  end

  def index
    @bath = Baths.all
  end

  def new
    @bath = Bath.new
  end

  def create
    @bath = Bath.new

    if @bath.save
      redirect_to root_path, notice: '登録完了しました'
    else
      render: new, status: :unprocessable_entity
    end

  end

  def destroy
    @bath.destroy
    redirect_to baths_path, notice: '削除完了しました'
  end

  privete

  def baths_params
    params.require(:milk).permit(:time, :memo).merge(user_id: current_user.id)
  end

  def set_bath
    @milk = current_user.milks.find(params[:id])
  end

end
