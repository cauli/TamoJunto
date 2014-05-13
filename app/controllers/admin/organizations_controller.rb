class Admin::OrganizationsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
  respond_to :html

  protected
  def collection
    @organizations ||= end_of_association_chain.page(params[:page]).order('created_at desc')
  end

  def permitted_params
    params.permit(organization: Organization.attribute_names.map(&:to_sym) - attributes_black_list)
  end

  def attributes_black_list
    [:id,
     :confirmed_at,
     :confirmation_token,
     :confirmation_sent_at,
     :created_at,
     :updated_at,
     :encrypted_password,
     :reset_password_token,
     :reset_password_sent_at,
     :remember_created_at,
     :sign_in_count,
     :current_sign_in_at,
     :last_sign_in_at,
     :current_sign_in_ip,
     :last_sign_in_ip
     ]
  end
end
