class Admin::UsersController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
end
