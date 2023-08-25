class MedicinesController < ApplicationController

  before_action :set_medicine, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @medicines = Medicine.all
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = current_user.medicines.new(medicine_params)

    if @medicine.save
      redirect_to medicines_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @medicine.update(medicine_params)
      redirect_to medicines_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medicine.destroy
    redirect_to medicines_path, notice: '削除完了しました'
  end

  private

  def medicine_params
    params.require(:medicine).permit(:time, :memo).merge(user_id: current_user.id)
  end

  def set_medicine
    @medicine = current_user.medicines.find(params[:id])
  end
  
end