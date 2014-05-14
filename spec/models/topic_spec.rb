require 'spec_helper'

describe Topic do
  describe 'Validations' do
    it { should validate_presence_of :title }
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :articles }
    it { should have_and_belong_to_many :documents }
    it { should have_and_belong_to_many :events }
    it { should have_and_belong_to_many :services }
    it { should have_and_belong_to_many :videos }
    it { should have_one :question }
  end

  describe '#search' do
    before do
      @topic = Topic.make! title: 'Test', tag_list: '1, 3, 4'
      @second_topic = Topic.make! title: 'Test 2', tag_list: '1, 3, 4'
      @third_topic = Topic.make! title: 'Test 3', tag_list: '2, 3, 4'
    end

    it { expect(Topic.search('2')).to include(@second_topic) }
    it { expect(Topic.search('2')).to include(@third_topic) }
    it { expect(Topic.search('2')).not_to include(@topic) }
  end
end
