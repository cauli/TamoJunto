class Admin::TopicsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  def sort
    resource.update_attribute :row_order_position, params[:topic][:row_order_position]

    render nothing: true
  end

  protected

  def permitted_params
    params.permit(topic: [:title,
                          :description,
                          :tag_list,
                          :row_order_position,
                          article_ids: [],
                          document_ids: [],
                          event_ids: [],
                          service_ids: [],
                          video_ids: []])
  end
end
