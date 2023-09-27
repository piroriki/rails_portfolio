class Admin::UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create, :edit, :update, :show]
  protect_from_forgery with: :exception, only: :create

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @group = Group.find(params[:family_id])

    if @user.save
      # ユーザー登録完了メール送信処理を追加
      CoyellMailer.user_creation_email(@user).deliver_now
      
      @group.families << @user
      redirect_to root_path(@user), notice: "「#{@user.name}」さんを登録しました"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: "「#{@user.name}」さんを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to admin_users_path, notice: "「#{@user.name}」さんを削除しました"
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
