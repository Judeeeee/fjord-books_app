class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.save
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:chat)
  end
end
