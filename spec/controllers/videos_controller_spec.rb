require 'spec_helper'

describe VideosController do

  describe '#show' do
    let(:video) { Video.make! }
    before { get :show, id: video }
    it { expect(response).to be_success }
    it { expect(response).to render_template('videos/show') }
    it { expect(assigns(:video)).to eq video }
  end

end

