class Article < ActiveRecord::Base
  include Shared::BeautifulText
  include Shared::Voteable
  include PgSearch

  has_and_belongs_to_many :topics
  belongs_to :user
  validates :title, :content, :user, presence: true

  beautiful_text_for [:content]
  dragonfly_accessor :image
  acts_as_taggable

  pg_search_scope :search_by_title, :against => :title

  def sanitized_content
    Sanitize.clean(content_html).try(:strip!)
  end

  def self.search(search)
    if search
      (search_by_title(search) + tagged_with(search)).uniq
    else
      none
    end
  end
end
