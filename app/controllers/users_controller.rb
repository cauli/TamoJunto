class UsersController < ApplicationController
  inherit_resources
  actions :show

  def show
    show!
  end
end
