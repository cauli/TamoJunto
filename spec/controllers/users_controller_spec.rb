require 'spec_helper'

describe UsersController do
  let(:user) { User.make! }

  let(:upvoted_article) { Article.make! }
  let(:upvoted_document) { Document.make! }
  let(:upvoted_video) { Video.make! }

  let(:downvoted_article) { Article.make! }
  let(:downvoted_document) { Document.make! }
  let(:downvoted_video) { Video.make! }

  describe '#show' do
    before do
      user.vote_for(upvoted_article)
      user.vote_for(upvoted_document)
      user.vote_for(upvoted_video)

      user.vote_against(downvoted_article)
      user.vote_against(downvoted_document)
      user.vote_against(downvoted_video)

      get :show, id: user.id
    end

    it { expect(response).to be_success}

    it { expect(assigns(:upvoted_articles)).to eq [upvoted_article] }
    it { expect(assigns(:upvoted_documents)).to eq [upvoted_document] }
    it { expect(assigns(:upvoted_videos)).to eq [upvoted_video] }

    it { expect(assigns(:downvoted_articles)).to eq [downvoted_article] }
    it { expect(assigns(:downvoted_documents)).to eq [downvoted_document] }
    it { expect(assigns(:downvoted_videos)).to eq [downvoted_video] }
  end
end
