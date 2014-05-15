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
    authorize resource
    if @diagnostic.answers.any?
      redirect_to diagnostic_path(@diagnostic)
    else
      @diagnostic.answers.build
      @theme_ids = @diagnostic.themes.map { |t| t.id }
      respond_with @diagnostic
    end
  end

  def update
    authorize resource
    update! do |success, failure|
      success.html { redirect_to diagnostic_path(resource) }
      failure.html do
        redirect_to diagnostic_questions_path(resource),
                    notice: t('controllers.diagnostics.questions_required')
      end
    end
  end

  def show
    authorize resource
    @topics = resource.main_topics
    @secondary_topics = resource.secondary_topics
    show!
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
