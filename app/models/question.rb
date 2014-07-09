class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :theme
  has_and_belongs_to_many :related_themes, class_name: :Theme
  has_many :questions

  validates :theme_id, :topic_id, :question_text,
            :good_answer, :bad_answer, presence: true

  scope :not_in_themes, ->(theme_ids) { where.not(theme_id: theme_ids) }
  scope :filtered, ->(theme_ids, showed_questions) do
    not_in_themes(theme_ids).where.not(id: showed_questions)
  end
end
