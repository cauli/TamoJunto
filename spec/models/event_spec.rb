require 'spec_helper'

describe Event do
  describe 'validations' do
    it { should validate_presence_of :organization_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :local }
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :ends_at }
    it { should validate_presence_of :time }
  end

  describe 'associations' do
    it { should belong_to :organization }
    it { should have_and_belong_to_many :topics }
  end

  describe 'tags' do
    it { should have_many :tags }
    it { should respond_to :tag_list }
    it { should respond_to :tag_list= }
  end

  describe 'scopes' do
    describe '.visible' do
      let(:pending) { Event.make! }
      let(:visible) { Event.make! }

      before { visible.approve }

      it { expect(Event.visible).to eq [visible] }
    end
  end
end
