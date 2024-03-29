require 'spec_helper'

describe DiagnosticsController do
  let(:user) { User.make! }
  let(:diagnostic) { Diagnostic.make! }

  before { sign_in user }

  describe '#show' do
    before do
      @question1 = Question.make! theme: diagnostic.themes.first
      @question2 = Question.make! theme: diagnostic.themes.last
      Answer.make! diagnostic: diagnostic, question: @question1
      Answer.make! diagnostic: diagnostic, question: @question2

      get :show, id: diagnostic
    end

    it { expect(response).to be_success }
    it { expect(response).to render_template('diagnostics/show') }
    it { expect(assigns(:diagnostic)).to eq diagnostic }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:diagnostic)).to be_new_record }
  end

  describe '#create' do
    before { post :create, diagnostic: diagnostic_params }
    it { expect(response).to redirect_to(diagnostic_questions_path(Diagnostic.last)) }
  end

  describe '#questions' do
    before { get :questions, diagnostic_id: diagnostic }
    it { expect(response).to be_success }
    it { expect(assigns(:diagnostic)).to eq diagnostic }
  end

  describe '#update' do
    before { post :update, id: diagnostic, diagnostic: answer_params }
    it { expect(response).to redirect_to(diagnostic_path(diagnostic)) }
  end

  protected
  def diagnostic_params
    Diagnostic.make.attributes.merge(theme_ids: [Theme.make!.id, Theme.make!.id])
  end

  def answer_params
    {ansewers: [ Answer.make!.attributes.merge(diagnostic: diagnostic),
                 Answer.make!.attributes.merge(diagnostic: diagnostic) ] }
  end
end
