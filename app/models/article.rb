class Article < ActiveRecord::Base
  include Shared::BeautifulText
  validates :title, :content, presence: true
  beautiful_text_for [:content]
  dragonfly_accessor :image

  def content_html_test
    self.content_html
  end
  def content_html_test=(html)
    self.content = ReverseMarkdown.parse(html)
  end
end
