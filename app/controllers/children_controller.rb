class ChildrenController < ApplicationController
  class Admin::UsersController < ApplicationController

    # skip_before_action :login_required, only: [:new, :create, :edit, :update, :show]
    protect_from_forgery with: :exception, only: :create
  
    def new
      @child = Child.new
    end
  
    def create
      @child = Child.new(child_params)
  
      if @child.save
        # ユーザー登録完了メール送信処理を追加
        CoyellMailer.child_creation_email(@child).deliver_now
        
        redirect_to root_path(@child), notice: "「#{@child.child_name}さん」を登録しました"
      else
        render :new, status: :unprocessable_entity
      end
  
    end
  
    def show
      @child = Child.find(params[:id])
    end
  
    def edit
      @child = Child.find(params[:id])
    end
  
    def update
      @child = Child.find(params[:id])
  
      if @child.update(child_params)
        redirect_to children_path, notice: "「#{@child.child_name}」を更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def index
      @children = Child.all
    end
  
    def destroy
      @child = Child.find(params[:id])
  
      @child.destroy
      redirect_to children_path, notice: "「#{@child.child_name}」を削除しました"
    end
  
  
    private
  
    def child_params
      params.require(:user).permit(:child_name, :age, :gender).merge(user_id: current_user.id)
    end

  end
  