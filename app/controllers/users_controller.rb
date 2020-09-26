class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @posts = Post.all
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
			redirect_to user_path(current_user.id)
		end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success_notice] = '変更しました'
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image, :user_level)
  end
end
