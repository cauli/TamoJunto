require 'spec_helper'

describe TopicsController do

  describe '#show' do
    let(:topic) { Topic.make! }
    before { get :show, id: topic }
    it { expect(response).to be_success }
    it { expect(response).to render_template('topics/show') }
    it { expect(assigns(:topic)).to eq topic }
  end

end
