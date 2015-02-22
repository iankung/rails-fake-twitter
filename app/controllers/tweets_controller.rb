class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweets = Tweet.all.order('created_at DESC')
  end

  def new
   @tweet = Tweet.new 
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.name = current_user.name
    @tweet.save
    redirect_to tweets_path
  end

  def show
  end


  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end

end
