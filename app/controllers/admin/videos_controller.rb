class Admin::VideosController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def collection
    @videos ||= end_of_association_chain.page(params[:page])
  end

  def permitted_params
    params.permit(video: [:title, :description, :url, :tag_list, topic_ids: []])
  end
end
