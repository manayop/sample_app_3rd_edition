require 'actions/follow_user'
require 'actions/unfollow_user'


class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = Actions::FollowUser.do current_user, params[:followed_id]
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
  def destroy

    @user = Actions::UnfollowUser.do current_user, params[:id]
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
