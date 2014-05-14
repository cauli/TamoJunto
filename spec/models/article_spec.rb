require 'spec_helper'

describe Article do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
  end

  describe 'Associations' do
    it { should have_and_belong_to_many :topics }
    it { should belong_to :user }
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
    let(:article) { Article.make! content: '**Hello!**' }
    it 'sanitizes content_html' do
      expect(Sanitize).to receive(:clean).with("<p><strong>Hello!</strong></p>\n")
      article.sanitized_content
    end

    it 'returns just the text' do
      expect(article.sanitized_content).to eq('Hello!')
    end
  end

  describe '#search' do
    before do
      @article = Article.make! title: 'Test', tag_list: '1, 3, 4'
      @second_article = Article.make! title: 'Test 2', tag_list: '1, 3, 4'
      @third_article = Article.make! title: 'Test 3', tag_list: '2, 3, 4'
    end

    it { expect(Article.search('2')).to include(@second_article) }
    it { expect(Article.search('2')).to include(@third_article) }
    it { expect(Article.search('2')).not_to include(@article) }
  end
end
