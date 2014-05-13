class Admin::EventsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  def reject
    resource.reject!
    redirect_to admin_events_path
  end

  def approve
    resource.approve!
    redirect_to admin_events_path
  end

  def cancel
    resource.cancel!
    redirect_to admin_events_path
  end

  protected
  def collection
    @events ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(event: [:name,
                          :image,
                          :description,
                          :local,
                          :starts_at,
                          :ends_at,
                          :time,
                          :organization_id,
                          :external_link,
                          :value,
                          :tag_list,
                          topic_ids: []])
  end
end
