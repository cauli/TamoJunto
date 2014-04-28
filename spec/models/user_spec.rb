require 'spec_helper'

describe User do
  before do
    @user = User.make!
  end

  it 'should valid' do
    expect(@user).to be_valid
  end

  describe 'password required?' do
    context 'news users' do
      before do
        @user = User.new
      end

      it 'requires a password' do
        expect(@user).to be_password_required
      end

      it 'should require password & match confirmation' do
        @user.password = nil
        @user.password_confirmation = nil
        expect(@user).not_to be_valid

        @user.password = 'niceguy'
        @user.password_confirmation = nil
        expect(@user).not_to be_valid

        @user.password = 'niceguy'
        @user.password_confirmation = 'Guy'
        expect(@user).not_to be_valid
      end
    end

    context 'existing user' do
      before do
        @user.save!
        @user = User.find @user.id
        end

      it 'requires a password when password is present' do
        @user.password = 'niceguy'
        expect(@user).to be_password_required
      end

      it 'requires a correct password when password_comfirmation is present' do
        @user.password_confirmation = 'xx'
        expect(@user).to be_password_required
      end

      it 'should not require password no password or confirmation is present' do
        expect(@user.reload).not_to be_password_required
      end

      it 'shoult not be required password' do
        @user.password = nil
        @user.password_confirmation = nil
        expect(@user).to be_valid
      end
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :gender }
  end

  describe "#avatar_url" do
    context 'with image' do
      let(:user) { User.make! image: File.open("#{Rails.root}/spec/fixtures/image.png") }

      it { expect(user.image_uid).to be_present }
      it { expect(user.avatar_url).to be_present }

    end

    context 'without avatar' do
      let(:user) { User.make! image_uid: nil }

      it { expect(user.image_uid).not_to be_present }
      it { expect(user.avatar_url).to be_present }

    end
  end

  describe '#vote' do
    subject(:user) { User.make! }

    describe 'can vote on articles' do
      before do
        @article = Article.make!
        user.vote_for(@article)
        user.reload
      end

      its(:vote_count){ should eq 1}
    end

    describe 'can vote on documents' do
      before do
        @document = Document.make!
        user.vote_for(@document)
        user.reload
      end

      its(:vote_count){ should eq 1}
    end

    describe 'can vote on documents' do
      before do
        @video = Video.make!
        user.vote_for(@video)
        user.reload
      end

      its(:vote_count){ should eq 1}
    end
  end

  describe 'retrieve liked objects' do
    subject(:user) { User.make! }

    describe 'Articles' do
      let(:upvoted) { Article.make! }
      let(:downvoted) { Article.make! }
      before do
        user.vote_for(upvoted)
        user.vote_against(downvoted)
        user.reload
      end

      its(:upvoted_articles) { should eq [upvoted]}
      its(:downvoted_articles) { should eq [downvoted] }
    end

    describe 'Documents' do
      let(:upvoted) { Document.make! }
      let(:downvoted) { Document.make! }

      before do
        user.vote_for(upvoted)
        user.vote_against(downvoted)
        user.reload
      end

      its(:upvoted_documents) { should eq [upvoted]}
      its(:downvoted_documents) { should eq [downvoted] }
    end

    describe 'Videos' do
      let(:upvoted) { Video.make! }
      let(:downvoted) { Video.make! }

      before do
        user.vote_for(upvoted)
        user.vote_against(downvoted)
        user.reload
      end

      its(:upvoted_videos) { should eq [upvoted]}
      its(:downvoted_videos) { should eq [downvoted] }
    end
  end
end
