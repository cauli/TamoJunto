class Diagnostic < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :themes

  validates :user_id, presence: true
end
