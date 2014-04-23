require 'spec_helper'

describe Service do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :local }
    it { should validate_presence_of :organization_id }
  end

  describe 'associations' do
    it { should belong_to :organization }
  end

  describe 'tags' do
    it { should have_many :tags }
    it { should respond_to :tag_list }
    it { should respond_to :tag_list= }
  end

  describe 'scopes' do
    describe '.visible' do
      let(:pending) { Service.make! }
      let(:visible) { Service.make! }

      before { visible.approve }

      it { expect(Service.visible).to eq [visible] }
    end
  end
end
