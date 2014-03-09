require 'spec_helper'

describe Event do
  describe 'validations' do
    it { should validate_presence_of :organization_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :local }
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :ends_at }
    it { should validate_presence_of :time }
  end

  describe 'associations' do
    it { should belong_to :organization }
  end
end
