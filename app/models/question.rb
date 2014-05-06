class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :theme
  belongs_to :related_theme, class_name: :Theme, foreign_key: :related_theme_id
  validates :theme_id, :related_theme_id,:topic_id, :question_text,
            :good_answer, :bad_answer, presence: true
end
