class HomeController < ApplicationController
  def index
    redirect_to user_path(current_user) if user_signed_in?
    redirect_to organization_path(current_organization) if organization_signed_in?
  end
end
