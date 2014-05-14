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
    it { should have_and_belong_to_many :topics }
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

  describe '#search' do
    before do
      @service = Service.make! name: 'Test',
                               tag_list: '1, 3, 4',
                               state: 'visible'
      @second_service = Service.make! name: 'Test 2',
                                      tag_list: '1, 3, 4',
                                      state: 'visible'
      @third_service = Service.make! name: 'Test 3',
                                     tag_list: '2, 3, 4',
                                     state: 'visible'
    end

    it { expect(Service.search('2')).to include(@second_service) }
    it { expect(Service.search('2')).to include(@third_service) }
    it { expect(Service.search('2')).not_to include(@service) }
  end
end
