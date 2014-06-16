require 'spec_helper'

describe Theme do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :image }
  end

  describe 'Associations' do
    it { should have_many :questions }
    it { should have_and_belong_to_many :related_questions }
    it { should have_and_belong_to_many :diagnostics }
  end

  describe '#image with dragonfly' do
    let(:theme) { Theme.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }
    it { expect(theme.image.url).to be_present }
  end
end
