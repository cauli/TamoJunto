class Article < ActiveRecord::Base
  include Shared::BeautifulText
  validates :title, :content, presence: true
  beautiful_text_for [:content]
end
