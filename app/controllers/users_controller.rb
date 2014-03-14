class UsersController < ApplicationController
  inherit_resources
  actions :show
  before_filter :authenticate_user!, only: [:upvotes, :downvotes]

  def upvotes
    @articles = current_user.upvoted_articles
    @documents = current_user.upvoted_documents
    @videos = current_user.upvoted_videos
  end

  def downvotes
    @articles = current_user.downvoted_articles
    @documents = current_user.downvoted_documents
    @videos = current_user.downvoted_videos
  end
end
