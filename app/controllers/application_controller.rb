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
                                                              :birthdate) }

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
                                                                     :email,
                                                                     :bio,
                                                                     :image,
                                                                     :location,
                                                                     :password,
                                                                     :current_password,
                                                                     :password_confirmation,
                                                                     :gender,
                                                                     :birthdate) }
    elsif resource_class == Organization
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,
                                                              :email,
                                                              :kind,
                                                              :password,
                                                              :password_confirmation) }

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
                                                                     :email,
                                                                     :kind,
                                                                     :image,
                                                                     :about,
                                                                     :city,
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
    end
    root_path
  end

  private

  def user_not_authorized
    flash[:error] = t('controllers.not_authorized')
    redirect_to(request.referrer || root_path)
  end
end

