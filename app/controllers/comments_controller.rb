class CommentsController < ApplicationController
  def create
    @commentable = Book.find(params[:book_id])
    @comment = @commentable.comments.build(comment_params)
    @comment.save
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:chat)
  end
end
