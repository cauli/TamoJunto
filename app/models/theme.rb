class Theme < ActiveRecord::Base
  dragonfly_accessor :image

  has_many :questions
  has_many :topics, through: :questions
  has_and_belongs_to_many :related_questions, class_name: :Question
  has_and_belongs_to_many :diagnostics
  validates :title, :image, presence: true
end
