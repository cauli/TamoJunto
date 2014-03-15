require 'spec_helper'

describe ServicesController do

  describe '#show' do
    let(:service) { Service.make! }
    before { get :show, id: service }
    it { expect(response).to be_success }
    it { expect(response).to render_template('services/show') }
    it { expect(assigns(:service)).to eq service }
  end

end

