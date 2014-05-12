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
    create! { diagnostic_questions_path(@diagnostic) }
  end

  def questions
    @diagnostic = Diagnostic.find(params[:diagnostic_id])
    @diagnostic.answers.build
    authorize resource
  end

  def update
    authorize resource
    update! { root_path }
  end


  protected
  def permitted_params
    params.permit(diagnostic: [:user_id,
                               answers_attributes: [:question_id, :option],
                               theme_ids: []])
  end

  def pundit_user
    current_user
  end
end
