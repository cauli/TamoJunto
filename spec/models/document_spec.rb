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
      subject {Document.make! file:  File.open("#{Rails.root}/spec/fixtures/image.png") }

      its(:file){ should be_present }
      its(:file_name){ should == 'image.png' }
    end
  end
end
