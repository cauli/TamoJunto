class UsersController < ApplicationController
  inherit_resources
  actions :show
  before_filter :authenticate_user!, only: [:upvotes, :downvotes]

  def show
    @user = User.find(params[:id])
    @upvoted_articles = @user.upvoted_articles
    @upvoted_documents = @user.upvoted_documents
    @upvoted_videos = @user.upvoted_videos

    @downvoted_articles = @user.downvoted_articles
    @downvoted_documents = @user.downvoted_documents
    @downvoted_videos = @user.downvoted_videos
    show!
  end
end
