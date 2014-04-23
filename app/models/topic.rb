class Topic < ActiveRecord::Base
  validates :title, presence: true

  has_and_belongs_to_many :articles

  acts_as_taggable
end
