require 'spec_helper'

describe Diagnostic do
  describe 'Associations' do
    it { should belong_to :user }
    it { should have_and_belong_to_many :questions }
  end

  describe 'Validations' do
    it { should validate_presence_of :user_id }
  end
end
