class Admin::TagsController < Admin::BaseController
  def index
    respond_to do |format|
      format.html do
        @tags = ActsAsTaggableOn::Tag.page(params[:page])
      end

      format.json do
        render json: ActsAsTaggableOn::Tag.
                      where('name ~ ?', params[:term]).
                        order(:name).
                        map { |t| { id: t.name, value: t.name, label: t.name } }
      end
    end
  end

  def destroy
    tag = ActsAsTaggableOn::Tag.find(params[:id])
    tag.destroy
    flash[:success] = t('.success')
    redirect_to admin_tags_path
  end
end
