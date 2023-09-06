class Temperature < ApplicationRecord
    before_action :set_temperature, only: [:show, :edit, :update, :destroy]

    # パンくずリストを追加する
    add_breadcrumb 'ホーム', 'http://localhost:3000'
    add_breadcrumb '体温一覧', 'temperatures_path', only: [:index]
    add_breadcrumb '体温詳細', 'temperature_path', only: [:show]
    add_breadcrumb '体温新規登録', 'new_temperature_path', only: [:new]
    add_breadcrumb '体温更新', 'edit_temperature_path', only: [:edit]
  
    def show
    end
  
    def index
      @temps = Temperature.all
      @q = current_user.temperatures.ransack(params[:q], auth_object: set_ransack_auth_object)
  
      if @q
        @temps = @q.result
      else
        @temps = Temperature.all
      end
      
      # kaminariで１ページあたり２５件を表示する（デフォルト設定）
      @temps = @q.result(distinct: true).page(params[:page])
    end
  
    def new
      @temp = Temperature.new
    end
  
    def create
      @temp = current_user.temperatures.new(temp_params)
  
      if @temp.save
        redirect_to temperatures_path, notice: '登録完了しました'
      else
        render :new, status: :unprocessable_entity
      end
  
    end
  
    def edit
    end
  
    def update
      if @temp.update(temp_params)
        redirect_to temps_path, notice: "更新完了しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @temp.destroy
      redirect_to temps_path, notice: '削除完了しました'
    end
  
    private
  
    def temp_params
      params.require(:temperature).permit(:temperature, :time).merge(user_id: current_user.id)
    end
  
    def set_temp
      @temp = current_user.temperatures.find(params[:id])
    end
    
    def set_ransack_auth_object
      current_user.admin? ? :admin : nil
    end
    
  end
  
end
