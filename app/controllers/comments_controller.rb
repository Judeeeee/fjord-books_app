class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    debugger
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:chat)
  end
end
