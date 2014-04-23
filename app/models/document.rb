class Document < ActiveRecord::Base
  include Shared::Voteable

  has_and_belongs_to_many :topics
  validates :title, :file, presence: true
  validates_property :ext, of: :file, in: %w{doc docx odt pages rtf txt tex csv key pps ppt pptx pdf xlr xls xlsx xml}, message: I18n.t('document.invalid_extension')

  dragonfly_accessor :file
  acts_as_taggable
end
