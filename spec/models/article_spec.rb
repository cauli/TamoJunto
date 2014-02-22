require 'spec_helper'

describe Article do
  describe 'validations' do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :content }
  end

  describe 'auto_html and beautiful text' do
    subject { Article.make! }
    it { expect(subject.content_html).not_to be_nil }
  end

  describe '#image with dragonfly' do
    let(:article) { Article.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }
    it { expect(article.image.url).to be_present }
  end
end
