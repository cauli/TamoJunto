require 'spec_helper'

describe Topic do
  describe 'Validations' do
    it { should validate_presence_of :title }
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :articles }
    it { should have_and_belong_to_many :documents }
    it { should have_and_belong_to_many :videos }
  end
end
