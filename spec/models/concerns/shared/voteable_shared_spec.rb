shared_examples 'a voteable model' do
  describe 'can be voted' do
    subject { resource }
    let(:user) { User.make! }

    before do
      user.vote_for(resource)
      resource.reload
    end

    its(:votes_count) { should eq 1}
  end
end
