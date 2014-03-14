require 'spec_helper'

describe ArticlesController do

  describe '#show' do
    let(:article) { Article.make! }
    before { get :show, id: article }
    it { expect(response).to be_success }
    it { expect(response).to render_template('articles/show') }
    it { expect(assigns(:article)).to eq article }
  end

  describe 'Vote behavior' do
    let(:article) { Article.make! }
    let(:user) { User.make! }

    before do
      sign_in user
      get :show, id: article
    end

    describe '#upvote' do
      before { get :upvote, id: article }
      it { expect(response).to redirect_to(article) }
      it { expect(assigns(:article)).to eq article }
      it { expect(assigns(:article).score).to eq 1 }
    end

    describe '#downvote' do
      before { get :downvote, id: article }
      it { expect(response).to redirect_to(article) }
      it { expect(assigns(:article)).to eq article }
      it { expect(assigns(:article).score).to eq (-1) }
    end
  end

end
