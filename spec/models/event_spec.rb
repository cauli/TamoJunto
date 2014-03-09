require 'spec_helper'

describe Event do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :local }
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :ends_at }
    it { should validate_presence_of :time }
  end
end
