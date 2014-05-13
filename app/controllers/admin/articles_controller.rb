class Admin::ArticlesController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  def create
    @article = Article.new(permitted_params[:article].merge(user: current_user))
    create!
  end

  protected
  def collection
    @articles ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(article: [:title,
                            :image,
                            :content,
                            :tag_list,
                            topic_ids: []])
  end
end
