class Topic < ActiveRecord::Base
  validates :title, presence: true

  acts_as_taggable
end
