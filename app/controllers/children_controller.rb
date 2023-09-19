class ChildrenController < ApplicationController

  protect_from_forgery with: :exception, only: :create

  # パンくずリストを追加する
  add_breadcrumb 'ホーム', 'http://localhost:3000'
  add_breadcrumb 'お子様一覧', 'children_path', only: [:index]
  add_breadcrumb 'お子様詳細', 'child_path', only: [:show]
  add_breadcrumb 'お子様新規登録', 'new_child_path', only: [:new]
  add_breadcrumb 'お子様更新', 'edit_child_path', only: [:edit]

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)

    if @child.save
      byebug
      redirect_to root_path(@child), notice: "「#{@child.child_name}」さんを登録しました"
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
    params.require(:child).permit(:child_name, :age, :gender).merge(user_id: current_user.id)
  end

end