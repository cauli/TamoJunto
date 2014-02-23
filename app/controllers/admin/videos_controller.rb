class Admin::VideosController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(video: [:title, :description, :url])
  end
end
