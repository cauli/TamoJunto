require 'spec_helper'

describe Document do

  describe 'validations' do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :file }
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :topics }
  end

  describe '#file' do
    context 'valid file' do
      subject {Document.make! file:  File.open("#{Rails.root}/spec/fixtures/file.txt") }

      its(:file){ should be_present }
      its(:file_name){ should == 'file.txt' }
    end

    context 'invalid file' do
      before do
        @document = Document.make!
        @document.file = File.open("#{Rails.root}/spec/fixtures/image.png")
        @document.save
      end

      it{ expect(@document.errors.messages).to eq ({:file => ["You can't upload that kind of file"]}) }
    end
  end

  describe 'can be voted' do
    let(:resource) { Document.make! }

    it_should_behave_like 'a voteable model'
  end

  describe 'tags' do
    it { should have_many :tags }
    it { should respond_to :tag_list }
    it { should respond_to :tag_list= }
  end

  describe "#search" do
    before do
      @document = Document.make! title: 'Test', tag_list: '1, 3, 4'
      @second_document = Document.make! title: 'Test 2', tag_list: '1, 3, 4'
      @third_document = Document.make! title: 'Test 3', tag_list: '2, 3, 4'
    end


    it { expect(Document.search('2')).to include(@second_document) }
    it { expect(Document.search('2')).to include(@third_document) }
  end
end
