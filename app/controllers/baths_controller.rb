class BathsController < ApplicationController

  before_action :set_, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @bath.update
      redirect_to baths_path, notice: '更新完了しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @baths = Bath.all
  end

  def new
    @bath = Bath.new
  end

  def create
    @bath = current_user.baths.new(bath_params)

    if @bath.save
      redirect_to root_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @bath.destroy
    redirect_to baths_path, notice: '削除完了しました'
  end

  private

  def baths_params
    params.require(:bath).permit(:time, :memo).merge(user_id: current_user.id)
  end

  def set_bath
    @bath = current_user.baths.find(params[:id])
  end

end
