require 'spec_helper'

describe Admin::ArticlesController do

  let(:user) { User.make! admin: true }
  let(:article) { Article.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:articles)).to eq [article] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:article)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: article }
    it { expect(response).to be_success }
    it { expect(assigns(:article)).to eq article }
  end

  describe '#create' do
    before { post :create, article: article_params }
    it { expect(response).to redirect_to(admin_articles_path) }
  end

  describe '#update' do
    before { post :create, id: article, article: article_params }
    it { expect(response).to redirect_to(admin_articles_path) }
  end

  protected
  def article_params
    Article.make.attributes
  end
end
