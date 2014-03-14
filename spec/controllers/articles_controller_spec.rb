require 'spec_helper'
require File.expand_path('../concerns/shared/voteable_actions_spec.rb', __FILE__)

describe ArticlesController do

  describe '#show' do
    let(:article) { Article.make! }
    before { get :show, id: article }
    it { expect(response).to be_success }
    it { expect(response).to render_template('articles/show') }
    it { expect(assigns(:article)).to eq article }
  end

  describe 'Vote behavior' do
    let(:resource) { Article.make! }
    let(:user) { User.make! }
    let(:symbol) { :article }

    it_should_behave_like 'a voteable object'
  end

end
