require 'spec_helper'

describe DocumentsController do

  describe '#show' do
    let(:document) { Document.make! }
    before { get :show, id: document }
    it { expect(response).to be_success }
    it { expect(response).to render_template('documents/show') }
    it { expect(assigns(:document)).to eq document }
  end

end

