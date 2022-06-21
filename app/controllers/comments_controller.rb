# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)

    @comment.posted_user_name = current_user.email if @comment.posted_user_name.blank?
    @comment.save!
    redirect_to '/'
  end

  private

  def comment_params
    params.require(:comment).permit(:chat, :posted_user_name)
  end
end
