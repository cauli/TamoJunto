require 'spec_helper'

describe EventPolicy do
  subject { described_class }

  let(:policy) { described_class.new(organization, event) }
  let(:organization) { nil }
  let(:event) { Event.make }

  shared_examples_for 'create permissions' do
    it 'denies access if organization is nil' do
      expect(subject).not_to permit(nil, event)
    end

    it 'denies access if organization is not the owner' do
      expect(subject).not_to permit(Organization.new, event)
    end

    it 'authorizes access if organization is the owner' do
      new_organization = event.organization
      expect(subject).to permit(new_organization, event)
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
