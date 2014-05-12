class Answer < ActiveRecord::Base
  belongs_to :diagnostic
  belongs_to :question

  validates :question_id, :diagnostic_id, presence: true
  validates_inclusion_of :option, in: [true, false]
end
