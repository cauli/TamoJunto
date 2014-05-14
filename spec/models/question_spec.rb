require 'spec_helper'

describe Question do
  describe 'Validations' do
    it { should validate_presence_of :theme_id }
    it { should validate_presence_of :topic_id }
    it { should validate_presence_of :question_text }
    it { should validate_presence_of :good_answer }
    it { should validate_presence_of :bad_answer }
  end

  describe 'Associations' do
    it { should belong_to :theme }
    it { should have_and_belong_to_many :related_themes }
    it { should belong_to :topic }
  end
end
