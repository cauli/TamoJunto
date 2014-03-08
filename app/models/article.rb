class Article < ActiveRecord::Base
  validates :title, :content, presence: true
  dragonfly_accessor :image
end
