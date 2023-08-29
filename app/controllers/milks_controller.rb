class MilksController < ApplicationController

  before_action :set_milk, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @milks = Milk.all
    @q = current_user.milks.ransack(params[:q], auth_object: set_ransack_auth_object)

    if @q
      @milks = @q.result
    else
      @milks = Milk.all
    end
    
    #@milks = @q.result(distinct: true).recent #resentスコープで表示順を変更
  end

  def new
    @milk = Milk.new
  end

  def create
    @milk = current_user.milks.new(milk_params)

    if @milk.save
      redirect_to milks_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @milk.update(milk_params)
      redirect_to milks_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @milk.destroy
    redirect_to milks_path, notice: '削除完了しました'
  end

  private

  def milk_params
    params.require(:milk).permit(:kinds, :amount, :time, :memo).merge(user_id: current_user.id)
  end

  def set_milk
    @milk = current_user.milks.find(params[:id])
  end
  
  def set_ransack_auth_object
    current_user.admin? ? :admin : nil
  end
  
end
