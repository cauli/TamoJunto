class Topic < ActiveRecord::Base
  validates :title, presence: true

  has_and_belongs_to_many :articles
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :events
  has_and_belongs_to_many :services
  has_and_belongs_to_many :videos
  has_one :question

  acts_as_taggable
end
