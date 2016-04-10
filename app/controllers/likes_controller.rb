class LikesController < ApplicationController
  before_action :signed_in_user
  before_action :find_set_of_likeable

  def like
    @set.add current_user.id
    @is_liked = @set.member? current_user.id
    render "likes/like_or_unlike"
  end

  def unlike
    @set.delete current_user.id
    @is_liked = @set.member? current_user.id
    render "likes/like_or_unlike"
  end

  private
  def find_set_of_likeable
    @likeable = params[:type].singularize.classify.constantize.find(params[:id])
    @set = @likeable.likers
  end

end
