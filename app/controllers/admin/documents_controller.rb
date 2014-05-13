class Admin::DocumentsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def collection
    @documents ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(document: [:title,
                             :description,
                             :file,
                             :tag_list,
                             topic_ids: []])
  end
end
