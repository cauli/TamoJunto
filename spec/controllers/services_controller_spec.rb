require 'spec_helper'

describe ServicesController do

  describe '#show' do
    let(:service) { Service.make! state: :visible }
    before { get :show, id: service }
    it { expect(response).to be_success }
    it { expect(response).to render_template('services/show') }
    it { expect(assigns(:service)).to eq service }
  end

  context 'authenticated as organization' do
    let(:organization) { Organization.make! }
    let(:service) { Service.make!(organization: organization) }
    before { sign_in organization }

    describe '#new' do
      before { get :new }
      it { expect(response).to be_success }
      it { expect(assigns(:service)).to be_new_record }
    end

    describe '#create' do
      before { post :create, service: service_params }
      it { expect(response).to redirect_to(service_path(Service.last)) }
    end

    describe '#edit' do
      before { get :edit, id: service }
      it { expect(response).to be_success }
      it { expect(assigns(:service)).to eq service }
    end

    describe '#update' do
      before { post :update, id: service, service: service_params }
      it { expect(response).to redirect_to(service_path(service)) }
    end

    describe '#destroy' do
      before { delete :destroy, id: service }
      it { expect(response).to redirect_to(root_path) }
      it { expect { service.reload }.to raise_error }
    end
  end

  protected
  def service_params
    Service.make.attributes.merge(organization_id: [organization.id])
  end
end
