require 'spec_helper'

describe Article do
  describe 'validations' do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :content_html }
  end

  describe '#image with dragonfly' do
    let(:article) { Article.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }
    it { expect(article.image.url).to be_present }
  end
end
