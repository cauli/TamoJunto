require 'spec_helper'

describe Admin::UsersController do
  let(:logged_user) {User.make! admin: true }
  let(:user) { User.make! }

  before do
    sign_in logged_user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:users)).to eq [logged_user, user] }
  end

  describe '#edit' do
    before { get :edit, id: user }
    it { expect(response).to be_success }
    it { expect(assigns(:user)).to eq user }
  end

  describe '#update' do
    before { post :update, id: user, user: user_params }
    it { expect(response).to redirect_to(admin_users_path) }
  end

  protected
  def user_params
    User.make.attributes.merge({ 'admin' => 'true' })
  end
end
