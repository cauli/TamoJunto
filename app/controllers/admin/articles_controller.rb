class Admin::ArticlesController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  def create
    @article = Article.new(permitted_params[:article].merge(user: current_user))
    create!
  end

  protected
  def permitted_params
    params.permit(article: [:title,
                            :image,
                            :content,
                            :tag_list,
                            topic_ids: []])
  end
end
