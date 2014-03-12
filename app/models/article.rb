class Article < ActiveRecord::Base
  validates :title, :content_html, presence: true
  dragonfly_accessor :image

  acts_as_voteable
end
