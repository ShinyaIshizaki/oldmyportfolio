class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザーを追加しました。"
      redirect_to("/users/#{@user.id}")
    else
      # flash.now[:danger] = "ユーザー登録をお願いします。"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :twitter, :linkedin, :line)
  end
end
