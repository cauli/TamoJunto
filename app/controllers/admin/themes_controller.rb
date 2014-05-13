class Admin::ThemesController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def collection
    @themes ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(theme: [:title, :description])
  end
end
