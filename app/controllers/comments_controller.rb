class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @user = current_user
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    if post.save
      experience = @user.experience
      experience += 1

      @user.experience = experience
      @user.update(experience: experience)

      levelSetting = LevelSetting.find_by(level: @user.user_level + 1)

      if levelSetting.threshold <= @user.experience
          @user.user_level = @user.user_level + 1
          @user.update(user_level: @user.user_level)
      end

      redirect_to posts_path
    else
      render 'index'
    end
    redirect_to post_path(post)
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
