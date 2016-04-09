class CommentsController < ApplicationController
  def create
    c = Comment.new(comment_params.merge(:user_id => current_user.id))
    c.save
    render :json => {}
  end


  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :body)
  end
end
