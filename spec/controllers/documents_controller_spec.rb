require 'spec_helper'

describe DocumentsController do

  describe '#show' do
    let(:document) { Document.make! }
    before { get :show, id: document }
    it { expect(response).to be_success }
    it { expect(response).to render_template('documents/show') }
    it { expect(assigns(:document)).to eq document }
  end

  describe 'Vote behavior' do
    let(:document) { Document.make! }
    let(:user) { User.make! }

    before do
      sign_in user
      get :show, id: document
    end

    describe '#upvote' do
      before { get :upvote, id: document }
      it { expect(response).to redirect_to(document) }
      it { expect(assigns(:document)).to eq document }
      it { expect(assigns(:document).score).to eq 1 }
    end

    describe '#downvote' do
      before { get :downvote, id: document }
      it { expect(response).to redirect_to(document) }
      it { expect(assigns(:document)).to eq document }
      it { expect(assigns(:document).score).to eq (-1) }
    end
  end

end

