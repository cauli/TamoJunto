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
    let(:resource) { Document.make! }
    let(:user) { User.make! }
    let(:symbol) { :document }

    it_should_behave_like 'a voteable object'
  end

end

