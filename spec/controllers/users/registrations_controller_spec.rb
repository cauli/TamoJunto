require 'spec_helper'

describe Users::RegistrationsController do
  describe 'Authenticated' do
    let(:user) { User.make! }
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    describe '#destroy' do
      context 'DELETE destroy' do
        before do
          delete :destroy, id: user.id
          user.reload
        end

        it { expect(user.active?).to be_false }
      end
    end
  end
end
