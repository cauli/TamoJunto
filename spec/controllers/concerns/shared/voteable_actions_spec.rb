shared_examples 'a voteable object' do
  before do
    sign_in user
    get :show, id: resource
  end

  describe '#upvote' do
    before { get :upvote, id: resource }
    it { expect(response).to redirect_to(resource) }
    it { expect(assigns(symbol)).to eq resource }
    it { expect(assigns(symbol).upvotes).to eq 1 }
  end

  describe '#downvote' do
    before { get :downvote, id: resource }
    it { expect(response).to redirect_to(resource) }
    it { expect(assigns(symbol)).to eq resource }
    it { expect(assigns(symbol).downvotes).to eq (1) }
  end
end
