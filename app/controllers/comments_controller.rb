class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @user = current_user
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save
      if @comment.save
        @user.experience +=1
        @user.save
        levelSetting = LevelSetting.find_by(level: @user.user_level + 1)
        if levelSetting.threshold <= @user.experience
          @user.user_level = @user.user_level + 1
          @user.update(user_level: @user.user_level)
        end
        redirect_to post_path(post)
      else
        redirect_to post_path(post)
      end
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
