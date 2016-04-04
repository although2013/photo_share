class LikesController < ApplicationController

  def create
    set = "#{params[:type]}#{params[:id]}"

    if $redis.sismember(set, current_user.name)
      $redis.srem(set, current_user.name)
    else
      $redis.sadd(set, current_user.name)
    end

    count = $redis.scard(set)
    render_text = "#{count} 次赞"
    render :json => {type: "#{params[:type]}", id: "#{params[:id]}", count: count, text: render_text}
  end

end
