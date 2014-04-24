require 'spec_helper'

describe Admin::DocumentsController do
  let(:user) {User.make! admin: true }
  let(:document) { Document.make! }
  let(:topic) { Topic.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:documents)).to eq [document] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:document)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: document }
    it { expect(response).to be_success }
    it { expect(assigns(:document)).to eq document }
  end

  describe '#create' do
    before { post :create, document: document_params }
    it { expect(response).to redirect_to(admin_documents_path) }
    it { expect(Document.last.topics).to eq [topic] }
  end

  describe '#update' do
    before { post :update, id: document, document: document_params }
    it { expect(response).to redirect_to(admin_documents_path) }
  end

  protected
  def document_params
    { 'title'       => 'Some nice file',
      'description' => 'Some nice description',
      'file'        => fixture_file_upload('file.txt', 'text/txt'),
      'topic_ids'   => [topic.id] }
  end
end
