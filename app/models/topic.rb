class Topic < ActiveRecord::Base
  validates :title, presence: true

  has_and_belongs_to_many :articles
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :videos

  acts_as_taggable
end
