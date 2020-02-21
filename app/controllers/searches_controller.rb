class SearchesController < ApplicationController
  
  def user
    @users = User.all.search(params[:search])
  end
  
  def tweet
    @tweets = Tweet.all.search(params[:tweet])
  end
  
  private

    def search(search)
      if search
        where(['name LIKE ?', "%#{search}%"])
      else
        all
      end
    end

    def search(tweet)
      if tweet
        where(['body LIKE ?', "%#{tweet}%"])
      else
        all
      end
    end
end