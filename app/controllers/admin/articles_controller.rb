class Admin::ArticlesController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(article: [:title,
                            :image,
                            :content_html,
                            :tag_list,
                            topic_ids: []])
  end
end
