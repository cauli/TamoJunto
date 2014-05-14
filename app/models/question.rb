class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :theme
  has_and_belongs_to_many :related_themes, class_name: :Theme
  has_and_belongs_to_many :diagnostics
  has_many :questions

  validates :theme_id, :topic_id, :question_text,
            :good_answer, :bad_answer, presence: true
end
