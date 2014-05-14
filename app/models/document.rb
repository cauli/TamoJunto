class Document < ActiveRecord::Base
  include Shared::Voteable
  include PgSearch

  has_and_belongs_to_many :topics
  validates :title, :file, presence: true
  validates_property :ext, of: :file, in: %w{doc docx odt pages rtf txt tex csv key pps ppt pptx pdf xlr xls xlsx xml}, message: I18n.t('document.invalid_extension')

  pg_search_scope :search_by_title, :against => :title

  dragonfly_accessor :file
  acts_as_taggable

  def self.search(search)
    if search
      (search_by_title(search) + tagged_with(search)).uniq
    else
      none
    end
  end
end
