require 'spec_helper'

describe VideosController do

  describe '#show' do
    let(:video) { Video.make! }
    before { get :show, id: video }
    it { expect(response).to be_success }
    it { expect(response).to render_template('videos/show') }
    it { expect(assigns(:video)).to eq video }
  end

  describe 'Vote behavior' do
    let(:video) { Video.make! }
    let(:user) { User.make! }

    before do
      sign_in user
      get :show, id: video
    end

    describe '#upvote' do
      before { get :upvote, id: video }
      it { expect(response).to redirect_to(video) }
      it { expect(assigns(:video)).to eq video }
      it { expect(assigns(:video).score).to eq 1 }
    end

    describe '#downvote' do
      before { get :downvote, id: video }
      it { expect(response).to redirect_to(video) }
      it { expect(assigns(:video)).to eq video }
      it { expect(assigns(:video).score).to eq (-1) }
    end
  end

end

