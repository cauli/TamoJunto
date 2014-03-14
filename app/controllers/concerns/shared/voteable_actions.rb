module Shared::VoteableActions

  extend ActiveSupport::Concern

  included do
    before_filter :authenticate_user!, only: [:upvote, :downvote]

    def upvote
      return unless resource.present?
      return unless user_signed_in?

      current_user.vote_exclusively_for(resource)

      respond_to do |format|
        format.html do
          redirect_to resource
        end
      end
    end

    def downvote
      return unless resource.present?
      return unless user_signed_in?

      current_user.vote_exclusively_against(resource)

      respond_to do |format|
        format.html do
          redirect_to resource
        end
      end
    end
  end
end
