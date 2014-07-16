class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :admin?
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  def admin?
    false
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,
                                                              :email,
                                                              :password,
                                                              :password_confirmation,
                                                              :gender,
                                                              :birthdate,
                                                              :city,
                                                              :state_id,
                                                              :business_name,
                                                              :business_type,
                                                              :business_created_at,
                                                              :about_business,
                                                              :contact) }

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
                                                                     :email,
                                                                     :bio,
                                                                     :image,
                                                                     :location,
                                                                     :password,
                                                                     :current_password,
                                                                     :password_confirmation,
                                                                     :gender,
                                                                     :birthdate,
                                                                     :city,
                                                                     :state_id,
                                                                     :business_name,
                                                                     :business_type,
                                                                     :business_created_at,
                                                                     :about_business,
                                                                     :contact) }
    elsif resource_class == Organization
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,
                                                              :email,
                                                              :kind,
                                                              :password,
                                                              :password_confirmation,
                                                              :city,
                                                              :state_id,
                                                              :business_created_at,
                                                              :contact) }

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
                                                                     :email,
                                                                     :kind,
                                                                     :image,
                                                                     :about,
                                                                     :city,
                                                                     :state_id,
                                                                     :business_created_at,
                                                                     :contact,
                                                                     :phone,
                                                                     :password,
                                                                     :current_password,
                                                                     :password_confirmation) }
    end
  end

  def after_sign_in_path_for(resource)
    if resource.kind_of?(User)
      unless resource.active?
        resource.update_attribute(:active, true)
        flash[:notice] = t('controllers.registrations.reactivated')
      end
      if resource.created_at.round == resource.current_sign_in_at.round
        #flash[:notice] = t('controllers.registrations.welcome', user: resource.name)
        user_path(resource, first_login: true)
      else
        user_path(resource)
      end
    else
      organization_path(resource)
    end
  end

  private

  def user_not_authorized
    flash[:error] = t('controllers.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end

