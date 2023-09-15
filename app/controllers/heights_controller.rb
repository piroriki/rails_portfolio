class HeightsController < ApplicationController

  before_action :set_height, only: [:show, :edit, :update, :destroy]

  # パンくずリストを追加する
  add_breadcrumb 'ホーム', 'http://localhost:3000'
  add_breadcrumb '身長一覧', 'milks_path', only: [:index]
  add_breadcrumb '身長詳細', 'height_path', only: [:show]
  add_breadcrumb '身長新規登録', 'new_height_path', only: [:new]
  add_breadcrumb '身長更新', 'edit_height_path', only: [:edit]

  def show
  end

  def index
    @heights = Height.all
    # @q = current_user.heights.ransack(params[:q], auth_object: set_ransack_auth_object)

    # if @q
    #   @milks = @q.result
    # else
    #   @milks = Milk.all
    # end
    
    # kaminariで１ページあたり２５件を表示する（デフォルト設定）
    # @milks = @q.result(distinct: true).page(params[:page])

    # lazy_high_chartで表示する身長の発育曲線の初期値を設定する
    xAxis_categories = ['0','1','2','3','4','5','6','7','8','9','10','11','12']

    # yAxis_categories = ['0','10','20','30','40','50','60','70','80']

    height_data = Height.all

    tickInterval = 0.1

    height_average = [49,53.5,55.6,59.1,62,64.3,66.2,67.9,69.3,70.6,71.8,72.8,73.8]

      # エリアチャートのグラフデータを作成する
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '発育曲線(1歳までの男の子)')
      f.chart(type: 'area')
      f.xAxis(categories: xAxis_categories)
      f.options[:yAxis] = { title: { text: '身長(cm)' }}
      # 発育曲線の最高値と最低値でエリアチャート表示するデータを指定する
      f.series(name: '平均中央値', data: height_average)
      f.series(name: '入力値', data: height_data)
    end

  end

  def new
    @height = Height.new
  end

  def create
    @height = current_user.heights.new(height_params)

    if @height.save
      redirect_to heights_path, notice: '登録完了しました'
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @height.update(height_params)
      redirect_to heights_path, notice: "更新完了しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @height.destroy
    redirect_to heights_path, notice: '削除完了しました'
  end

  private

  def height_params
    params.require(:height).permit(:height, :time).merge(user_id: current_user.id)
  end

  def set_height
    @height = current_user.heights.find(params[:id])
  end
  
  # def set_ransack_auth_object
  #   current_user.admin? ? :admin : nil
  # end
  
end
