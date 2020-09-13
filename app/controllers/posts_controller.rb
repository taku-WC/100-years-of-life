class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = current_user
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      @posts = Post.all
    else
      @post = post.all
      render 'index'
    end
  end

  def index
    @posts = Post.all.page(params[:page]).reverse_order
    @post = Post.new
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :post_image, :user_id)
  end
end
