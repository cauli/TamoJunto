require 'spec_helper'

describe Theme do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe 'Associations' do
    it { should have_many :questions }
    it { should have_many :related_questions }
    it { should have_and_belong_to_many :diagnostics }
  end
end
