class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
    @comments = @user.comments
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
