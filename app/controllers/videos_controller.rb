class VideosController < ApplicationController
  include Shared::VoteableActions
  inherit_resources
  actions :show
end
