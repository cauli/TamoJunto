class Admin::VideosController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(video: [:title, :description, :url, :tag_list, topic_ids: []])
  end
end
