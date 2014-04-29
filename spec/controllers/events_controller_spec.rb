require 'spec_helper'

describe EventsController do

  describe '#show' do
    let(:event) { Event.make! }
    before { get :show, id: event }
    it { expect(response).to be_success }
    it { expect(response).to render_template('events/show') }
    it { expect(assigns(:event)).to eq event }
  end

  context 'authenticated as organization' do
    let(:organization) { Organization.make! }
    let(:event) { Event.make!(organization: organization) }
    before { sign_in organization }

    describe '#new' do
      before { get :new }
      it { expect(response).to be_success }
      it { expect(assigns(:event)).to be_new_record }
    end

    describe '#create' do
      before { post :create, event: event_params }
      it { expect(response).to redirect_to(event_path(Event.last)) }
    end

    describe '#edit' do
      before { get :edit, id: event }
      it { expect(response).to be_success }
      it { expect(assigns(:event)).to eq event }
    end

    describe '#update' do
      before { post :update, id: event, event: event_params }
      it { expect(response).to redirect_to(event_path(event)) }
    end

    describe '#destroy' do
      before { delete :destroy, id: event }
      it { expect(response).to redirect_to(root_path) }
      it { expect { event.reload }.to raise_error }
    end
  end

  protected
  def event_params
    Event.make.attributes.merge(organization_id: [organization.id])
  end
end
