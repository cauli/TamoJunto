class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :theme
  validates :theme_id, :topic_id, :question_text,
            :good_answer, :bad_answer, presence: true
end
