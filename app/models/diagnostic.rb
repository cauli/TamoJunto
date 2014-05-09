class Diagnostic < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :answers

  validates :user_id, presence: true
end
