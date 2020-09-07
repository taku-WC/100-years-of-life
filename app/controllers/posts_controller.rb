class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      @post = post.all
      render 'index'
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
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

  private

  def post_params
    params.require(:post).permit(:post, :post_image, :user_id)
  end
end
