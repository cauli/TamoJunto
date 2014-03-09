class Admin::OrganizationsController < Admin::BaseController
  inherit_resources
  actions :all, except: [:new, :create, :show]
end
