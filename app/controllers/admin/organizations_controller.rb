class Admin::OrganizationsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def collection
    @organizations ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(organization: Organization.attribute_names.map(&:to_sym))
  end
end
