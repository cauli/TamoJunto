require 'spec_helper'

describe UsersController do
  let(:user) { User.make! }
  describe '#show' do
    before { get :show, id: user.id }
    it { expect(response).to be_success}
  end
end
