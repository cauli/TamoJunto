class Article < ActiveRecord::Base
  include Shared::BeautifulText
  include Shared::Voteable

  has_and_belongs_to_many :topics
  validates :title, :content, presence: true

  beautiful_text_for [:content]
  dragonfly_accessor :image
  acts_as_taggable

  def sanitized_content
    Sanitize.clean(content_html)
  end
end
