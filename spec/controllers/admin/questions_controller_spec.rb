require 'spec_helper'

describe Admin::QuestionsController do
  let(:user) { User.make! admin: true }
  let(:question) { Question.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:questions)).to eq [question] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:question)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: question }
    it { expect(response).to be_success }
    it { expect(assigns(:question)).to eq question }
  end

  describe '#create' do
    before { post :create, question: question_params }
    it { expect(response).to redirect_to(admin_questions_path) }
  end

  describe '#update' do
    before { post :update, id: question, theme: question_params }
    it { expect(response).to redirect_to(admin_questions_path) }
  end

  protected
  def question_params
    Question.make.attributes
  end
end
