require 'spec_helper'

describe EventsController do

  describe '#show' do
    let(:event) { Event.make! }
    before { get :show, id: event }
    it { expect(response).to be_success }
    it { expect(response).to render_template('events/show') }
    it { expect(assigns(:event)).to eq event }
  end

end
