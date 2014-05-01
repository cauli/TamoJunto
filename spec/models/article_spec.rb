require 'spec_helper'

describe Article do
  describe 'validations' do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :content }
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :topics }
  end

  describe 'auto_html and beautiful text' do
    subject { Article.make! }
    it { expect(subject.content_html).not_to be_nil }
  end

  describe '#image with dragonfly' do
    let(:article) { Article.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }
    it { expect(article.image.url).to be_present }
  end

  describe 'can be voted' do
    let(:resource) { Article.make! }

    it_should_behave_like 'a voteable model'
  end

  describe 'tags' do
    it { should have_many :tags }
    it { should respond_to :tag_list }
    it { should respond_to :tag_list= }
  end

  describe '#sanitized_content' do
    let(:article) { Article.make! content_html: '<b>Hello!</b>' }
    it 'sanitizes content_html' do
      expect(Sanitize).to receive(:clean).with('<b>Hello!</b>')
      article.sanitized_content
    end

    it 'returns just the text' do
      expect(article.sanitized_content).to eq('Hello!')
    end
  end
end
