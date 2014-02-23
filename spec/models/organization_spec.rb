require 'spec_helper'

describe Organization do
  before do
    @organization = Organization.make!
  end

  it 'should valid' do
    expect(@organization).to be_valid
  end

  describe 'password required?' do
    context 'news organizations' do
      before do
        @organization = Organization.new
      end

      it 'requires a password' do
        expect(@organization).to be_password_required
      end

      it 'should require password & match confirmation' do
        @organization.password = nil
        @organization.password_confirmation = nil
        expect(@organization).not_to be_valid

        @organization.password = 'niceguy'
        @organization.password_confirmation = nil
        expect(@organization).not_to be_valid

        @organization.password = 'niceguy'
        @organization.password_confirmation = 'Guy'
        expect(@organization).not_to be_valid
      end
    end

    context 'existing organization' do
      before do
        @organization.save!
        @organization = Organization.find @organization.id
      end

      it 'requires a password when password is present' do
        @organization.password = 'niceguy'
        expect(@organization).to be_password_required
      end

      it 'requires a correct password when password_comfirmation is present' do
        @organization.password_confirmation = 'xx'
        expect(@organization).to be_password_required
      end

      it 'should not require password no password or confirmation is present' do
        expect(@organization.reload).not_to be_password_required
      end

      it 'shoult not be required password' do
        @organization.password = nil
        @organization.password_confirmation = nil
        expect(@organization).to be_valid
      end
    end
  end

  describe 'validations' do
    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :password }
    it{ should ensure_inclusion_of(:kind).in_array(%w[individual legal_entity NGO university public_organ])}
  end

  describe "image" do
    let(:organization) { Organization.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }
    it { expect(organization.image_uid).to be_present }
  end
end
