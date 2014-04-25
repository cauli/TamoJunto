class Admin::QuestionsController < Admin::BaseController
  inherit_resources
  actions :all, except: :show
  respond_to :html

  protected
  def permitted_params
    params.permit(question: [:topic_id, :theme_id,
                             :question_text,
                             :good_answer, :bad_answer])
  end
end
