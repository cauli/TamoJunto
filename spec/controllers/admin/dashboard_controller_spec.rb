require 'spec_helper'

describe Admin::DashboardController do

  context 'when user is not admin' do
    let(:user) { User.make! }
    before do
      sign_in user
      get :index
    end

    it { expect(response).to redirect_to(root_path) }
    it { expect(flash[:error]).to eq 'You are not authorized to access this page!' }
  end

  context 'when user is not admin' do
    let(:user) { User.make! admin: true }
    before do
      sign_in user
      get :index
    end

    it { expect(response).to be_success }
  end
end
