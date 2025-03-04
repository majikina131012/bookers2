class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(params[:user_id])
    relationship = Relationship.new
    relationship.followed_id = user.id
    relationship.follower_id = current_user.id
    relationship.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    relationship = Relationship.find_by(followed_id: user.id)
    relationship.destroy
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.following_users
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.follower_users
  end

end
