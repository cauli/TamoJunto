require 'spec_helper'

describe Admin::ThemesController do
  let(:user) { User.make! admin: true }
  let(:theme) { Theme.make! }

  before do
    sign_in user
    get :index
  end

  describe '#index' do
    before { get :index }
    it { expect(response).to be_success }
    it { expect(assigns(:themes)).to eq [theme] }
  end

  describe '#new' do
    before { get :new }
    it { expect(response).to be_success }
    it { expect(assigns(:theme)).to be_new_record }
  end

  describe '#edit' do
    before { get :edit, id: theme }
    it { expect(response).to be_success }
    it { expect(assigns(:theme)).to eq theme }
  end

  describe '#create' do
    before { post :create, theme: theme_params }
    it { expect(response).to redirect_to(admin_themes_path) }
  end

  describe '#update' do
    before { post :update, id: theme, theme: theme_params }
    it { expect(response).to redirect_to(admin_themes_path) }
  end

  protected
  def theme_params
    { "title"       => 'Some nice theme',
      'description' => 'Some nice theme description' }
  end
end
