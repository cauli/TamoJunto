module User::Voter
  extend ActiveSupport::Concern

  included do
    acts_as_voter

    def upvoted_articles
      self.votes.where(voteable_type: 'Article').where(vote: true).map{ |v| Article.find(v.voteable_id) }
    end

    def downvoted_articles
      self.votes.where(voteable_type: 'Article').where(vote: false).map{ |v| Article.find(v.voteable_id) }
    end

    def upvoted_documents
      self.votes.where(voteable_type: 'Document').where(vote: true).map{ |v| Document.find(v.voteable_id) }
    end

    def downvoted_documents
      self.votes.where(voteable_type: 'Document').where(vote: false).map{ |v| Document.find(v.voteable_id) }
    end

    def upvoted_videos
      self.votes.where(voteable_type: 'Video').where(vote: true).map{ |v| Video.find(v.voteable_id) }
    end

    def downvoted_videos
      self.votes.where(voteable_type: 'Video').where(vote: false).map{ |v| Video.find(v.voteable_id) }
    end
  end
end

