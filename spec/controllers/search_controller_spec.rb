require 'spec_helper'

describe SearchController do
  before do
    @article = Article.make! title: 'search'
    @document = Document.make!
    @event = Event.make! name: 'search'
    @service = Service.make!
    @video = Video.make! title: 'search'
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(response).to render_template('search/index') }
    it { expect(assigns(:articles)).to eq [@article] }
    it { expect(assigns(:documents)).to eq [@document] }
    it { expect(assigns(:events)).to eq [@event] }
    it { expect(assigns(:services)).to eq [@service] }
    it { expect(assigns(:videos)).to eq [@video] }
  end

  describe '#search' do
    before{ post :index, search: { query: 'search' } }
    it { expect(response).to be_success }
    it { expect(response).to render_template('search/index') }
    it { expect(assigns(:articles)).to eq [@article] }
    it { expect(assigns(:documents)).to eq [] }
    it { expect(assigns(:events)).to eq [@event] }
    it { expect(assigns(:services)).to eq [] }
    it { expect(assigns(:videos)).to eq [@video] }
  end
end



