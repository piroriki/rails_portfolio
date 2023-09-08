class WeightsController < ApplicationController
  
  before_action :set_weight, only: [:show, :edit, :update, :destroy]

  # パンくずリストを追加する
  add_breadcrumb 'ホーム', 'http://localhost:3000'
  add_breadcrumb '体重一覧', 'weights_path', only: [:index]
  add_breadcrumb '体重詳細', 'weight_path', only: [:show]
  add_breadcrumb '体重新規登録', 'new_weight_path', only: [:new]
  add_breadcrumb '体重更新', 'edit_weight_path', only: [:edit]

  def show
  end

  def index
    @weights = Weight.all
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
    @mweight = Weight.new
  end

  def create
    @weight = current_user.weights.new(weight_params)

    if @weight.save
      redirect_to weights_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @weight.update(weight_params)
      redirect_to weights_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @weight.destroy
    redirect_to weights_path, notice: '削除完了しました'
  end

  private

  def weight_params
    params.require(:weight).permit(:weight, :time).merge(user_id: current_user.id)
  end

  def set_weight
    @weight = current_user.weights.find(params[:id])
  end
  
  # def set_ransack_auth_object
  #   current_user.admin? ? :admin : nil
  # end
  
end

end
