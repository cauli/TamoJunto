class Theme < ActiveRecord::Base
  has_many :questions
  has_many :related_questions, class_name: :Question, foreign_key: :related_theme_id
  validates :title, :description, presence: true
end
