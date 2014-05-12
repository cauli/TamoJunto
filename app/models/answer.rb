class Answer < ActiveRecord::Base
  belongs_to :diagnostic
  belongs_to :question

  validates :question_id, :diagnostic_id, presence: true
  validates_inclusion_of :option, in: [true, false]

  scope :by_theme, ->(theme) do
    includes(:question).where('questions.theme_id = ?', theme.id).references(:questions)
  end

  scope :bad, -> { where(option: false) }
end
