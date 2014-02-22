require 'spec_helper'

describe Users::SessionsController do
  describe 'Reactivate User' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.make!
      @user.update_attribute(:active, false)
      post :create, user: { email: @user.email, password: 'niceguy123' }
      @user.reload
    end

    it { expect(@user.active?).to be_true }
  end
end
