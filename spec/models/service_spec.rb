require 'spec_helper'

describe Service do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :local }
    it { should validate_presence_of :organization_id }
  end

  describe 'associations' do
    it { should belong_to :organization }
  end
end
