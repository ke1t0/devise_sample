class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.search(params[:search])
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
    @comments = @user.comments
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.following
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
