class HeadCircumferencesController < ApplicationController

  before_action :set_head_circumference, only: [:show, :edit, :update, :destroy]  

  # パンくずリストを追加する
  add_breadcrumb 'ホーム', 'http://localhost:3000'
  add_breadcrumb '頭囲一覧', 'head_circumferences_path', only: [:index]
  add_breadcrumb '頭囲詳細', 'head_circumference_path', only: [:show]
  add_breadcrumb '頭囲新規登録', 'new_head_circumference_path', only: [:new]
  add_breadcrumb '頭囲更新', 'edit_head_circumference_path', only: [:edit]  
  
  def show
  end 
  
  def index
    @head_circumferences = HeadCircumference.all
    # @q = current_user.milks.ransack(params[:q], auth_object: set_ransack_auth_object) 
    # if @q
    #   @milks = @q.result
    # else
    #   @milks = Milk.all
    # end

    # kaminariで１ページあたり２５件を表示する（デフォルト設定）
    # @milks = @q.result(distinct: true).page(params[:page])
  end 

  def new
    @head_circumference = HeadCircumference.new
  end 

  def create
    @head_circumference = current_user.head_circumferences.new(head_circumference_params) 
    
    if @head_circumference.save
      redirect_to head_circumferences_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end 

  end 

  def edit
  end 
  
  def update
  
    if @head_circumference.update(head_circumference_params)
      redirect_to head_circumferences_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  
  end 

  def destroy
    @head_circumference.destroy
    redirect_to head_circumferences_path, notice: '削除完了しました'
  end 
  
  private 
  
  def head_circumference_params
    params.require(:head_circumference).permit(:circumference, :time, :memo).merge(user_id: current_user.id)
  end 

  def set_head_circumference
    @head_circumference = current_user.head_circumferences.find(params[:id])
  end

  # def set_ransack_auth_object
  #   current_user.admin? ? :admin : nil
  # end
  
end
