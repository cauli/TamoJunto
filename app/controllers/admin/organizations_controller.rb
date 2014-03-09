class Admin::OrganizationsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def permitted_params
    params.permit(organization: [:name, :kind])
  end
end
