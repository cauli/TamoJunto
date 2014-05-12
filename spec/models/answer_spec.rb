require 'spec_helper'

describe Answer do
  describe 'Associations' do
    it { should belong_to :question }
    it { should belong_to :diagnostic }
  end

  describe 'Validations' do
    it { should validate_presence_of :question_id }
    it { should validate_presence_of :diagnostic_id }
  end
end
