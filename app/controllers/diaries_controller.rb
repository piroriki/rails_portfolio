class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy, :dearch_tag]

  def show
    @tag_list = @diary.diary_tags.pluck(:tag_name).join(',')
    @diary_tags = @diary.diary_tags
  end

  def index
    @diaries = Diary.all
    @tag_list = DiaryTag.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.new(diary_params)

    # 受け取った値を,で分割して配列にする
    tag_list = params[:diary][:tag_name].split(',')

    if @diary.save

      # 紐づいたタグを保存するメソッドは、diaryモデルファイル内に記載あり
      @diary.save_diary_tags(tag_list) 

      redirect_to diaries_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    # 日記に紐づく全てのdiary_tagを取得後,で連結し、ひとつの配列として@tag_listに格納させる
    @tag_list = @diary.diary_tags.pluck(:tag_name).join(',')
  end

  def update
    @tag_list = params[:diary][:tag_name].split(',')

    if @diary.update(diary_params)
      @diary.save_diary_tags(@tag_list)
      redirect_to diaries_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: '削除完了しました'
  end

  def search_tag
    # 検索画面でタグを一覧表示する
    @tag_list = DiaryTag.all

    # 検索されたタグを受け取る変数を設定する
    @tag = DiaryTag.find(params[:diary_tag_id])

    # 検索されたタグに紐づく育児日記を表示する
    @diaries = @tag.diaries
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end
  
end

