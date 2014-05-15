class OrganizationsController < ApplicationController
  inherit_resources
  actions :show

  def show
    if current_organization == resource
      @events = resource.events
      @services = resource.services
    else
      @events = resource.events.visible
      @services = resource.services.with_state('visible')
    end

    show!
  end
end
