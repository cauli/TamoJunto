class Admin::ThemesController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(theme: [:title, :description])
  end
end
