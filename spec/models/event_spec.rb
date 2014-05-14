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
      context 'when event is not finished yet' do
        let(:pending) { Event.make! ends_at: Time.now + 1.day }
        let(:visible) { Event.make! ends_at: Time.now + 1.day }

        before { visible.approve }

        it { expect(Event.visible).to eq [visible] }
      end

      context 'when event is finished yet' do
        let(:visible) { Event.make! ends_at: Time.now - 1.day }

        before { visible.approve }

        it { expect(Event.visible).to eq [] }
      end
    end
  end

  describe '#search' do
    before do
      @event = Event.make! name: 'Test',
                           tag_list: '1, 3, 4',
                           state: 'visible'
      @second_event = Event.make! name: 'Test 2',
                                  tag_list: '1, 3, 4',
                                  state: 'visible'
      @third_event = Event.make! name: 'Test 3',
                                 tag_list: '2, 3, 4',
                                 state: 'visible'
    end

    it { expect(Event.search('2')).to include(@second_event) }
    it { expect(Event.search('2')).to include(@third_event) }
  end
end
