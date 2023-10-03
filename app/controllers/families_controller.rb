class FamiliesController < ApplicationController

  before_action :set_family, only: [:edit, :update, :destroy]

  def index
    @families =Family.all
  end

  def new
    @family = Family.new
  end

  def create
    @family = current_user.families.new(family_params)

    if @family.save
      current_user.families << @family
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @family.update
      redirect_to root_path, notice: "#{@family.name}を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @family.destroy
    redirect_to root_path, notice: "#{@family.name}の削除が完了しました"
  end

  private

    def family_params
      params.require(:family).permit(:name)
    end

    def set_family
      current_user.families.find(params[:id])
    end

end
