class EventsController < ApplicationController
  inherit_resources
  actions :show
  respond_to :html
end