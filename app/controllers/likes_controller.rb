class LikesController < ApplicationController

  def create
    set = "#{params[:type]}#{params[:id]}"

    if $redis.sismember(set, current_user.id)
      $redis.srem(set, current_user.id)
      render_text = 'Like'
    else
      $redis.sadd(set, current_user.id)
      render_text = 'Unlike'
    end

    count = $redis.scard(set)
    render :json => {type: "#{params[:type]}", id: "#{params[:id]}", count: count, text: render_text}
  end

end
