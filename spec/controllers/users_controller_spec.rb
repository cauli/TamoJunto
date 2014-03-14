require 'spec_helper'

describe UsersController do
  let(:user) { User.make! }
  describe '#show' do
    before { get :show, id: user.id }
    it { expect(response).to be_success}
  end

  describe '#upvotes' do
    let(:article) { Article.make! }
    let(:document) { Document.make! }
    let(:video) { Video.make! }

    before do
      user.vote_for(article)
      user.vote_for(document)
      user.vote_for(video)
      sign_in user
      get :upvotes
    end

    it { expect(response).to be_success }
    it { expect(assigns(:articles)).to eq [article] }
    it { expect(assigns(:documents)).to eq [document] }
    it { expect(assigns(:videos)).to eq [video] }
  end

  describe '#downvotes' do
    let(:article) { Article.make! }
    let(:document) { Document.make! }
    let(:video) { Video.make! }

    before do
      user.vote_against(article)
      user.vote_against(document)
      user.vote_against(video)
      sign_in user
      get :downvotes
    end

    it { expect(response).to be_success }
    it { expect(assigns(:articles)).to eq [article] }
    it { expect(assigns(:documents)).to eq [document] }
    it { expect(assigns(:videos)).to eq [video] }
  end
end
