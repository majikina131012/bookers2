class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(prams[:user_id])
    relationship = Relationship.new
    relationship.followed_id = user.id
    relationship.follower_id = current_user.id
    relationship.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(prams[:user_id])
    relationship = Relationship.find_by(followed_id: user.id)
    relationship.follower_id = current_user.id
    relationship.destroy
    redirect_to request.referer
  end

end
