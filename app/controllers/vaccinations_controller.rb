class VaccinationsController < ApplicationController

  before_action :set_vaccination, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @vaccinations = Vaccination.all
  end

  def new
    @vaccination = Vaccination.new
  end

  def create
    @vaccination = current_user.vaccinations.new(vaccination_params)

    if @vaccination.save
      redirect_to vaccinations_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @vaccination.update(vaccination_params)
      redirect_to vaccinations_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vaccination.destroy
    redirect_to vaccinations_path, notice: '削除完了しました'
  end

  private

  def vaccination_params
    params.require(:vaccination).permit(:kinds, :time, :memo).merge(user_id: current_user.id)
  end

  def set_vaccination
    @vaccination = current_user.vaccinations.find(params[:id])
  end
  
end
