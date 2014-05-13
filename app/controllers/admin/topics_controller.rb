class Admin::TopicsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def collection
    @topics ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(topic: [:title,
                          :description,
                          :tag_list,
                          article_ids: [],
                          document_ids: [],
                          event_ids: [],
                          service_ids: [],
                          video_ids: []])
  end
end
