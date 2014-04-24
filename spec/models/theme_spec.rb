require 'spec_helper'

describe Theme do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe 'Associations' do
    it { should have_many :questions }
  end
end
