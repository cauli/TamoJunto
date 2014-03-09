require 'spec_helper'

describe Admin::OrganizationsController do
  let(:logged_user) {User.make! admin: true }
  let(:organization) { Organization.make! }

  before do
    sign_in logged_user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:organizations)).to eq [organization] }
  end

  describe '#edit' do
    before { get :edit, id: organization }
    it { expect(response).to be_success }
    it { expect(assigns(:organization)).to eq organization }
  end

  describe '#update' do
    before { post :update, id: user, organization: organization_params }
    it { expect(response).to redirect_to(admin_organization_path) }
  end

  protected
  def organization_params
    Organization.make.attributes.merge({ 'kind' => 'legal_entity' })
  end
end
