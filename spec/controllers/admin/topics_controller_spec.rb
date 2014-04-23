require 'spec_helper'

describe Admin::TopicsController do
  let(:user) { User.make! admin: true }
  let(:topic) { Topic.make! }
  let(:article) { Article.make! }
  let(:document) { Document.make! }
  let(:event) { Event.make! }
  let(:video) { Video.make! }

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
    it { expect(Topic.last.articles).to eq [article] }
    it { expect(Topic.last.documents).to eq [document] }
    it { expect(Topic.last.events).to eq [event] }
    it { expect(Topic.last.videos).to eq [video] }
  end

  describe '#update' do
    before { post :update, id: topic, topic: topic_params }
    it { expect(response).to redirect_to(admin_topics_path) }
  end

  protected
  def topic_params
    { 'title'         => 'Some nice topic',
      'description'   => 'Some nice topic description',
      'article_ids'   => [article.id],
      'document_ids'  => [document.id],
      'event_ids'     => [event.id],
      'video_ids'     => [video.id] }
  end
end
