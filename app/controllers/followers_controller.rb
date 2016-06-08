class FollowersController < ApplicationController

  def create
    @followed = User.find(params[:id])
    @followed.followers << current_user
    redirect_to posts_path
  end

  def destroy
    followedId = params[:id]
    Following.find_by(user_id: followedId, follower_id: current_user.id).destroy
    redirect_to posts_path
  end
end
