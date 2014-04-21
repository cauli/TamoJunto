require 'spec_helper'

describe Admin::TopicsController do
  let(:user) { User.make! admin: true }
  let(:topic) { Topic.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:topics)).to eq [topic] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:topic)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: topic }
    it { expect(response).to be_success }
    it { expect(assigns(:topic)).to eq topic }
  end

  describe '#create' do
    before { post :create, topic: topic_params }
    it { expect(response).to redirect_to(admin_topics_path) }
  end

  describe '#update' do
    before { post :update, id: topic, topic: topic_params }
    it { expect(response).to redirect_to(admin_topics_path) }
  end

  protected
  def topic_params
    { 'title'       => 'Some nice topic',
      'description' => 'Some nice topic description' }
  end
end
