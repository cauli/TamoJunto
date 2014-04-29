class EventsController < ApplicationController
  after_filter :verify_authorized, except: [:show]
  inherit_resources
  actions :all, except: :index
  respond_to :html

  def new
    @event = Event.new(organization: current_organization)
    authorize @event
    respond_with @event
  end

  def create
    @event = Event.new(permitted_params[:event].merge(organization: current_organization))
    authorize @event
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
    params.permit(event: [:name,
                          :image,
                          :description,
                          :local,
                          :starts_at,
                          :ends_at,
                          :time,
                          :external_link,
                          :value,
                          :tag_list])
  end

  def pundit_user
    current_organization
  end
end
