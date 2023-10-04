class LikesController < ApplicationController
  
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(likes_params)

    if @likes.save
      rederect_to diaries_path, notice: 'いいねを追加しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def likes_params
    params.require(:like).permit()
end
