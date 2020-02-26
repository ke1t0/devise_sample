class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      redirect_to new_tweet_path
    end
  end

  def index
    @tweets = Tweet.all.search(params[:search])
    @tweets = Tweet.page(params[:page]).per(10)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = current_user.comments.build
    @comments = @tweet.comments
  end

  def destroy
    @tweet = Tweet.find_by(user_id: current_user.id)
    @tweet.destroy
    redirect_to tweets_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body, :image)
    end
end
