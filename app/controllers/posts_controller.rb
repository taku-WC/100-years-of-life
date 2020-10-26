class PostsController < ApplicationController
  def new
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       @posts = Post.all
        experience = @user.experience
        experience += 1

        @user.experience = experience
        @user.update(experience: experience)

        levelSetting = LevelSetting.find_by(level: @user.user_level + 1)

        if levelSetting.threshold <= @user.experience
            @user.user_level = @user.user_level + 1
            @user.update(user_level: @user.user_level)
       end
    else
      render 'index'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = current_user
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
    if @post.save
      @user.experience +=1
      @user.save

      levelSetting = LevelSetting.find_by(level: @user.user_level + 1)

      if levelSetting.threshold <= @user.experience
          @user.user_level = @user.user_level + 1
          @user.update(user_level: @user.user_level)
      end

      redirect_to posts_path
    else
      render 'index'
    end
  end

  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
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
