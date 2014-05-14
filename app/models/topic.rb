class Topic < ActiveRecord::Base
  include PgSearch

  validates :title, presence: true

  has_and_belongs_to_many :articles
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :events
  has_and_belongs_to_many :services
  has_and_belongs_to_many :videos
  has_one :question

  acts_as_taggable

  pg_search_scope :search_by_title, :against => :title

  def self.search(search)
    if search
      search_by_title(search) + tagged_with(search)
    else
      none
    end
  end
end
