class TweetsController < ApplicationController

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if user_signed_in? && current_user.id = tweet.user_id
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def show
    tweet = Tweet.find(params[:id])
  end

  private


  def tweet_params
    params.permit(:text, :image).merge(user_id: current_user.id)
  end

  
end
