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

  describe 'scopes' do
    before do
      @question1 = Question.make!
      @question2 = Question.make!
      @question3 = Question.make!
    end
    describe 'not_in_themes' do
      it { expect(Question.not_in_themes([@question1.theme])).to include(@question2) }
      it { expect(Question.not_in_themes([@question1.theme])).to include(@question3) }
      it { expect(Question.not_in_themes([@question1.theme])).not_to include(@question1) }
    end

    describe 'filtered' do
      it { expect(Question.filtered([@question1.theme], [@question2.id])).to include(@question3) }
      it { expect(Question.filtered([@question1.theme], [@question2.id])).not_to include(@question2) }
      it { expect(Question.filtered([@question1.theme], [@question2.id])).not_to include(@question1) }
    end
  end
end
