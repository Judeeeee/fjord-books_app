class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.posted_user_name?
      @comment.posted_user_name = @comment.posted_user_name
    else
      @comment.posted_user_name = current_user.email
    end
    @comment.save
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:chat, :posted_user_name)
  end
end
