class Admin::UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create, :edit, :update, :show]
  protect_from_forgery with: :exception, only: :create

  def new
    @user = Form::User.new
    #@user.group.build
  end

  def create
    @user = Form::User.new(user_params)

    if @user.save

      # ユーザー登録完了メール送信処理を追加
      CoyellMailer.user_creation_email(@user).deliver_now

      redirect_to root_path, notice: "「#{@user.name}」さんを登録しました"

    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @user = Form::User.find(params[:id])
  end

  def edit
    @user = Form::User.find(params[:id])
  end

  def update
    @user = Form::User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "「#{@user.name}」さんを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @users = Form::User.all
  end

  def destroy
    @user = Form::User.find(params[:id])

    @user.destroy
    redirect_to admin_users_path, notice: "「#{@user.name}」さんを削除しました"
  end


  private

  def user_params
    params.require(:form_user).permit(Form::User::REGISTRABLE_ATTRIBUTES + [groups_attributes: Form::Group::REGISTRABLE_ATTRIBUTES])
  end

end
