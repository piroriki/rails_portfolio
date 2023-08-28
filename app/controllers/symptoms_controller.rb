class SymptomsController < ApplicationController


  before_action :set_symptom, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @symptom.update(symptom_params)
      redirect_to symptoms_path, notice: '更新完了しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @symptoms = Symptom.all
  end

  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = current_user.symptoms.new(symptom_params)

    if @symptom.save
      redirect_to symptoms_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @symptom.destroy
    redirect_to symptoms_path, notice: '削除完了しました'
  end

  private

  def symptom_params
    params.require(:symptom).permit(:kinds, :time, :memo).merge(user_id: current_user.id)
  end

  def set_symptom
    @symptom = current_user.symptoms.find(params[:id])
  end

end
