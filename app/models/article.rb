class Article < ActiveRecord::Base
  include Shared::Voteable
  validates :title, :content_html, presence: true

  dragonfly_accessor :image
  acts_as_taggable
end
