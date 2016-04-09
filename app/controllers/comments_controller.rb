class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params.merge(:user_id => current_user.id))
    @comment.save
  end

  def destroy

  end


  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :body)
  end
end
