require 'spec_helper'

describe Admin::ServicesController do

  let(:user) { User.make! admin: true }
  let(:service) { Service.make! }
  let(:topic) { Topic.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:services)).to eq [service] }
  end

  describe '#edit' do
    before { get :edit, id: service }
    it { expect(response).to be_success }
    it { expect(assigns(:service)).to eq service }
  end

  describe '#update' do
    before { post :update, id: service, service: service_params }
    it { expect(response).to redirect_to(admin_services_path) }
    it { expect(Service.find(service.id).topics).to eq [topic] }
  end

  describe '#destroy' do
    before { delete :destroy, id: service }
    it { expect(response).to redirect_to(admin_services_path) }
    it { expect { service.reload }.to raise_error }
  end

  describe '#reject' do
    before { get :reject, id: service }
    it { expect(response).to redirect_to(admin_services_path) }
    it 'should be rejected' do
      expect(service.reload.rejected?).to be_true
    end
  end

  describe '#approve' do
    before { get :approve, id: service }
    it { expect(response).to redirect_to(admin_services_path) }
    it 'should be visible' do
      expect(service.reload.visible?).to be_true
    end
  end

  protected
  def service_params
    Service.make.attributes.merge(topic_ids: [topic.id])
  end
end
