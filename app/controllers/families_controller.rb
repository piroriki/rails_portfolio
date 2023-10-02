class FamiliesController < ApplicationController

  before_action :set_family, only: [:edit, :update, :destroy]

  def new
    @user = current_user
    @family = @user.families.build(family_params)
  end

  def create
    @family = @user.families.build(family_params)

    if @family.save
      @user.families << @family
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

  private

    def family_params
      params.require(:family).permit(:name).merge(user_id: current_user.id)
    end

    def set_family
      current_user.families.find(params[:id])
    end

end
