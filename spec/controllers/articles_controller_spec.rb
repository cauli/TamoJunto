require 'spec_helper'

describe ArticlesController do

  describe '#show' do
    let(:article) { Article.make! }
    before { get :show, id: article }
    it { expect(response).to be_success }
    it { expect(response).to render_template('articles/show') }
    it { expect(assigns(:article)).to eq article }
  end

end
