class UsersController < ApplicationController
  before_action :authenticate_user!     # ログイン認証されていなければ、ログイン画面へリダイレクトする
 
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  
  

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  # 特定のユーザーが現在ログインしているユーザーではない場合、homeにページ移動する。
  
   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
end
