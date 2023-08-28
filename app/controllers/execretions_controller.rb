class ExecretionsController < ApplicationController
  before_action :set_execretion, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @execretions = Execretion.all
  end

  def new
    @execretion = Execretion.new
  end

  def create
    @execretion = current_user.execretions.new(execretion_params)

    if @execretion.save
      redirect_to execretions_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @execretion.update(execretion_params)
      redirect_to execretions_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @execretion.destroy
    redirect_to execretions_path, notice: '削除完了しました'
  end

  private

  def execretion_params
    params.require(:execretion).permit(:kinds, :time, :memo).merge(user_id: current_user.id)
  end

  def set_execretion
    @execretion = current_user.execretions.find(params[:id])
  end
  
end
