class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.new(diary_params)

    # 受け取った値を,で分割して配列にする
    tag_list = params[:diary][:name].split(',')

    if @diary.save
      
      # 紐づいたタグを保存するメソッドは、diaryモデルファイル内に記載あり
      @diary.save_diary_tags(tag_list) 

      redirect_to diaries_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: '削除完了しました'
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end
  
end

