class Document < ActiveRecord::Base
  validates :name, :file_uid, presence: true

  dragonfly_accessor :file
end
