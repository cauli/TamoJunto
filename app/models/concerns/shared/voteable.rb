module Shared::Voteable
  extend ActiveSupport::Concern

  included do
    acts_as_voteable

    def upvotes
      self.votes.where(vote: true).count
    end

    def downvotes
      self.votes.where(vote: false).count
    end
  end
end
