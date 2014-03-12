require 'spec_helper'

describe Video do
  describe 'validations' do
    it{ should validate_presence_of :title }

    describe 'invalid url' do
      before do
        @video = Video.make!
        @video.url = 'www.invalid.com'
        @video.save
      end
      subject { @video }


      it{ should_not be_valid }
      it 'should have the correct error message' do
        @video.errors.messages[:url].should == ["URL isn't valid"]
      end
    end

    describe 'valid url' do
      subject { @video = Video.make! }

      it{ should be_valid }
    end
  end

  describe 'embed_url' do
    before do
      @video = Video.make!
      @video.save
    end
    subject { @video }

    its(:embed_url){ should == 'www.youtube.com/embed/xRrL7Zgi8Rg' }
  end

  describe 'can be voted' do
    subject(:video) { Video.make! }
    let(:user) { User.make! }

    before do
      user.vote_for(video)
      video.reload
    end

    its(:votes_count) { should eq 1}
  end
end
