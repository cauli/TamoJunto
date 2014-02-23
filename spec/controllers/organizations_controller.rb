require 'spec_helper'

describe OrganizationsController do
  let(:organization) { Organization.make! }
  describe '#show' do
    before { get :show, id: organization.id }
    it { expect(response).to be_success}
  end
end

