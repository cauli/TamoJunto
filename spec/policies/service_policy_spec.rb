require 'spec_helper'

describe ServicePolicy do
  subject { described_class }

  let(:policy) { described_class.new(organization, service) }
  let(:organization) { nil }
  let(:service) { Service.make }

  shared_examples_for 'create permissions' do
    it 'denies access if organization is nil' do
      expect(subject).not_to permit(nil, service)
    end

    it 'denies access if organization is not the owner' do
      expect(subject).not_to permit(Organization.new, service)
    end

    it 'authorizes access if organization is the owner' do
      new_organization = service.organization
      expect(subject).to permit(new_organization, service)
    end
  end

  permissions :create? do
    it_should_behave_like 'create permissions'
  end

  permissions :update? do
    it_should_behave_like 'create permissions'
  end

  permissions :destroy? do
    it_should_behave_like 'create permissions'
  end
end
