class Admin::ServicesController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def permitted_params
    params.permit(service: [:name, :image, :description,
                            :local, :external_link,
                            :value, :organization_id])
  end
end
