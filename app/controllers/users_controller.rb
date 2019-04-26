class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @current_user = @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を編集しました。"
    else
      render 'edit'
    end
  end

  def like_feeds
    @user = User.find(params[:id])
    @favorites = current_user.favorite_feeds.all
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password,
                                 :password_confirmation, :profile,
                                 :image, :image_cache)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to new_session_path
    end
  end
end
