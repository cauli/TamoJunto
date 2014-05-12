class AnswersController < ApplicationController
  inherit_resources
  belongs_to :diagnostic

  protected
  def permitted_params
    params.permit(answer: [:question_id, :option, :diagnostic_id])
  end
end
