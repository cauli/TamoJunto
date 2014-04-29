class ServicesController < ApplicationController
  after_filter :verify_authorized, except: [:show]
  inherit_resources
  actions :all, except: :index
  respond_to :html

  def new
    @service = Service.new(organization: current_organization)
    authorize @service
    respond_with @service
  end

  def create
    @service = Service.new(permitted_params[:service].merge(organization: current_organization))
    authorize @service
    create!
  end

  def edit
    authorize resource
    edit!
  end

  def update
    authorize resource
    update!
  end

  def destroy
    authorize resource
    destroy!
  end

  protected
  def permitted_params
    params.permit(service: [:name, :image, :description,
                            :local, :external_link,
                            :value,
                            :tag_list])
  end

  def pundit_user
    current_organization
  end
end

