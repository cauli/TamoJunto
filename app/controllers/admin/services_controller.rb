class Admin::ServicesController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  def reject
    resource.reject!
    redirect_to admin_services_path
  end

  def approve
    resource.approve!
    redirect_to admin_services_path
  end

  protected
  def collection
    @services ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(service: [:name, :image, :description,
                            :local, :external_link,
                            :value, :organization_id,
                            :tag_list, topic_ids: []])
  end
end
