class Admin::DocumentsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(document: [:title, :description, :file, :tag_list])
  end
end
