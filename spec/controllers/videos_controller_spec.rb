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
    let(:resource) { Video.make! }
    let(:user) { User.make! }
    let(:symbol) { :video }

    it_should_behave_like 'a voteable object'
  end

end

