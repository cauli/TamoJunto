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
    if permitted_params.present?
      @diagnostic = Diagnostic.new({user: current_user}.merge(permitted_params[:diagnostic]))
    else
      @diagnostic = Diagnostic.new
      route = '#'
    end
    authorize @diagnostic
    if @diagnostic.save
      route = diagnostic_questions_path(@diagnostic)
    end
    respond_with @diagnostic, action: :new,
                              location: route
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
    if resource.answers.any?
      @topics = resource.main_topics
      @secondary_topics = resource.secondary_topics
      show!
    else
      redirect_to diagnostic_questions_path(resource)
    end
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
