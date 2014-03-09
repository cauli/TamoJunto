class Admin::EventsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def permitted_params
    params.permit(event: [:name, :image, :description, :local, :starts_at, :ends_at, :time])
  end
end
