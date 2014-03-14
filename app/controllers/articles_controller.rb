class ArticlesController < ApplicationController
  include Shared::VoteableActions
  inherit_resources
  actions :show
  respond_to :html
end
