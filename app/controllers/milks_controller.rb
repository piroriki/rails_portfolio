class MilksController < ApplicationController
  def show
    @milk = Milk.find(params[:id])
  end

  def index
    @milks = Milk.all
  end

  def new
    @milk = Milk.new
  end

  def create
    milk = Milk.new(milk_params)
    if milk.save
      redirect_to root_path, notice: "登録完了しました"
    else
      render :new
    end
  end

  def edit
    @milk = Milk.find(params[:id])
  end

  def update
    milk = Milk.find(params[:id])
    if milk.update!(milk_params)
      redirect_to milks_path, notice: "更新完了しました"
    else
      render :edit
    end
  end

  private

  def milk_params
    params.require(:milk).permit(:kinds, :amount, :time, :memo).merge(user_id: current_user.id)
  end
end
