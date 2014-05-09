class Answer < ActiveRecord::Base
  belongs_to :diagnostic
  belongs_to :question

  validates :question_id, :diagnostic_id, :option, presence: true
end
