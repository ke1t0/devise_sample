class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweet_path(tweet.id)
  end

  def destroy
    comment = Comment.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    comment.destroy
    redirect_to tweet_path(tweet.id)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end