class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  def comfirm
  end

  def quit
  end

  def levelup
  end

end
