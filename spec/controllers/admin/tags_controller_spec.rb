require 'spec_helper'

describe Admin::TagsController do
  let(:user) { User.make! admin: true }
  let(:tag) { ActsAsTaggableOn::Tag.make! }

  before do
    tag
    sign_in user
  end

  describe '#index' do
    context 'when format is html' do
      before { get :index, term: 'test' }
      it { expect(response).to be_success }
      it { expect(assigns(:tags)).to eq [tag] }
    end

    context 'when format is json' do
      before { get :index, term: 'test', format: :json }
      it { expect(response).to be_success }
      it { expect(response.body).to eq "[{\"id\":\"test\",\"value\":\"test\",\"label\":\"test\"}]" }
    end
  end

  describe '#destroy' do
    before { delete :destroy, id: tag }
    it { expect(response).to redirect_to(admin_tags_path) }
    it { expect { tag.reload }.to raise_error }
    it { expect(flash[:success]).to_not be_nil }
  end
end
