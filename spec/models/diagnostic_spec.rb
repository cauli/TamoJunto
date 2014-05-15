require 'spec_helper'

describe Diagnostic do
  describe 'Associations' do
    it { should belong_to :user }
    it { should have_many :answers }
    it { should have_and_belong_to_many :themes }
  end

  describe 'Validations' do
    it { should validate_presence_of :user_id }
  end

  describe 'topics' do
    before do
        @question1 = Question.make!
        @question2 = Question.make!
        @question3 = Question.make! theme: @question1.theme
        @question4 = Question.make! theme: @question2.theme
        @diagnostic = Diagnostic.make! themes: [@question1.theme,
                                                @question2.theme]
    end

    context 'all answers false' do
      before do
        Answer.make! question: @question1,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question2,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question3,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question4,
                     diagnostic: @diagnostic,
                     option: false
      end

      it { expect(@diagnostic.main_topics).to eq [@question1.topic,
                                                  @question2.topic] }
    end

    context 'last then first answers false' do
      before do
        Answer.make! question: @question1,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question2,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question3,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question4,
                     diagnostic: @diagnostic,
                     option: true
      end

      it { expect(@diagnostic.main_topics).to eq [@question3.topic,
                                                  @question2.topic] }
    end

    context 'first then last answers false' do
      before do
        Answer.make! question: @question1,
                     diagnostic: @diagnostic,
                     option: false
        Answer.make! question: @question2,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question3,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question4,
                     diagnostic: @diagnostic,
                     option: false
      end

      it { expect(@diagnostic.main_topics).to eq [@question1.topic,
                                                  @question4.topic] }
    end

    context 'all answers true' do
      before do
        Answer.make! question: @question1,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question2,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question3,
                     diagnostic: @diagnostic,
                     option: true
        Answer.make! question: @question4,
                     diagnostic: @diagnostic,
                     option: true
      end

      it { expect(@diagnostic.main_topics).to eq [@question1.topic,
                                                  @question2.topic] }
    end
  end
end
