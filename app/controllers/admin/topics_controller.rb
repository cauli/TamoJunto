class Admin::TopicsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(topic: [:title, :description, :tag_list])
  end
end
