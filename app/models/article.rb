class Article < ActiveRecord::Base
  include Shared::Voteable

  has_and_belongs_to_many :topics
  validates :title, :content_html, presence: true

  dragonfly_accessor :image
  acts_as_taggable

  def sanitized_content
    Sanitize.clean(content_html)
  end
end
