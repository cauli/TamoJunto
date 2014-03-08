class Article < ActiveRecord::Base
  validates :title, :content_html, presence: true
  dragonfly_accessor :image
end
