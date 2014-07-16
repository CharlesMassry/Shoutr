class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @shouts = current_user.shouts
    @followers = current_user.followers
    @followed_users = current_user.followed_users
  end
end
