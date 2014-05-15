class Diagnostic < ActiveRecord::Base
  include Diagnostic::Topics

  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :answers

  accepts_nested_attributes_for :answers

  validates :user_id, presence: true
end
