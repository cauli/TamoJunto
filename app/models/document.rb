class Document < ActiveRecord::Base
  validates :title, :file, presence: true

  dragonfly_accessor :file
end
