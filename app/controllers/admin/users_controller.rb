class Admin::UsersController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def permitted_params
    params.permit(user: [:name, :admin])
  end
end
