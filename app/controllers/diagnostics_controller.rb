class DiagnosticsController < ApplicationController
  after_filter :verify_authorized
  inherit_resources
  actions :all, except: [:destroy, :edit]
  respond_to :html

  def new
    @diagnostic = Diagnostic.new(user: current_user)
    authorize @diagnostic
    respond_with @diagnostic
  end

  def create
    @diagnostic = Diagnostic.new(permitted_params[:diagnostic].
                       merge(user: current_user))
    authorize @diagnostic
    create!
  end

  def questions?
    authorize resource
    edit!
  end

  def update
    authorize resource
    update!
  end


  protected
  def permitted_params
    params.permit(diagnostic: [:user_id,
                               question_ids: [],
                               theme_ids: []])
  end

  def pundit_user
    current_user
  end
end
