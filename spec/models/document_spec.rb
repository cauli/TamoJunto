require 'spec_helper'

describe Document do
  subject(:document) { Document.make! }

  it{ should be_valid }

  describe 'validations' do
    it{ should validate_presence_of :title }
    it{ should validate_presence_of :file }
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
end
