require 'spec_helper'

describe Admin::EventsController do

  let(:user) { User.make! admin: true }
  let(:event) { Event.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:events)).to eq [event] }
  end


  describe '#edit' do
    before { get :edit, id: event }
    it { expect(response).to be_success }
    it { expect(assigns(:event)).to eq event }
  end

  describe '#update' do
    before { post :update, id: event, event: event_params }
    it { expect(response).to redirect_to(admin_events_path) }
  end

  describe '#destroy' do
    before { delete :destroy, id: event }
    it { expect(response).to redirect_to(admin_events_path) }
    it { expect { event.reload }.to raise_error }
  end

  describe '#reject' do
    before { get :reject, id: event }
    it { expect(response).to redirect_to(admin_events_path) }
    it 'should be rejected' do
      expect(event.reload.rejected?).to be_true
    end
  end

  describe '#approve' do
    before { get :approve, id: event }
    it { expect(response).to redirect_to(admin_events_path) }
    it 'should be visible' do
      expect(event.reload.visible?).to be_true
    end
  end

  describe '#cancel' do
    before { get :cancel, id: event }
    it { expect(response).to redirect_to(admin_events_path) }
    it 'should be canceled' do
      expect(event.reload.canceled?).to be_true
    end
  end

  protected
  def event_params
    Event.make.attributes
  end
end

