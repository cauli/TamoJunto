class Diagnostic < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  validates :user_id, presence: true
end
