class MilksController < ApplicationController
  def show
    @milk = current_user.milks.find(params[:id])
  end

  def index
    @milks = current_user.milks
  end

  def new
    @milk = Milk.new
  end

  def create
    @milk = current_user.milks.new(milk_params)

    if @milk.save
      redirect_to root_path(@milk), notice: "登録完了しました"
    else
      render :new
    end

  end

  def edit
    @milk = current_user.milks.find(params[:id])
  end

  def update
    @milk = current_user.milks.find(params[:id])

    if @milk.update(milk_params)
      redirect_to milks_path, notice: "更新完了しました"
    else
      render :edit
    end

  end

  def destroy
      milk = current_user.milks.find(params[:id])

      milk.destroy
      redirect_to milks_path, notice: '削除完了しました'
  end

  private

  def milk_params
    params.require(:milk).permit(:kinds, :amount, :time, :memo).merge(user_id: current_user.id)
  end
  
end
