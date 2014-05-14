class Theme < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :related_questions, class_name: :Question
  has_and_belongs_to_many :diagnostics
  validates :title, :description, presence: true
end
