require 'spec_helper'

describe Admin::VideosController do
  let(:user) {User.make! admin: true }
  let(:video) { Video.make! }
  let(:topic) { Topic.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:videos)).to eq [video] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:video)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: video }
    it { expect(response).to be_success }
    it { expect(assigns(:video)).to eq video }
  end

  describe '#create' do
    before { post :create, video: video_params }
    it { expect(response).to redirect_to(admin_videos_path) }
    it { expect(Video.last.topics).to eq [topic] }
  end

  describe '#update' do
    before { post :create, id: video, video: video_params }
    it { expect(response).to redirect_to(admin_videos_path) }
  end

  protected
  def video_params
    Video.make.attributes.merge({ 'topic_ids' => [topic.id] })
  end
end
