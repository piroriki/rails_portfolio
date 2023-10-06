class LikesController < ApplicationController
  
  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.build(diary_id: params[:diary_id])

    if @like.save
      redirect_to diaries_path, notice: 'いいねを追加しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, diary_id: params[:diary_id])
    @like.destroy
    redirect_to diaries_path, notice: 'いいねを削除しました'
  end

end
