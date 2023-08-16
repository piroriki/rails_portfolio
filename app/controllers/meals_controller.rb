class MealsController < ApplicationController
  
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to meals_path, notice: '更新完了しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.new(meal_params)

    if @meal.save
      redirect_to meals_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: '削除完了しました'
  end

  private

  def meal_params
    params.require(:meal).permit(:kinds, :amount, :time, :memo).merge(user_id: current_user.id)
  end

  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

end
