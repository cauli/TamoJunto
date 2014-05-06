class Theme < ActiveRecord::Base
  has_many :questions
  has_many :related_questions, class_name: :Question, foreign_key: :related_theme_id
  has_and_belongs_to_many :diagnostics
  validates :title, :description, presence: true
end
