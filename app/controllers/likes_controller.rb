class LikesController < ApplicationController
  
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(user_id: current_user.id, diary_id: params[:deary_id])

    if @likes.save
      rederect_to diaries_path, notice: 'いいねを追加しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to diaries_path, notice: 'いいねを削除しました'
  end

end
