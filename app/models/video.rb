class Video < ActiveRecord::Base
  include Shared::Voteable
  include PgSearch

  has_and_belongs_to_many :topics
  validates :title, :url, presence: true
  validates_format_of :url, with: /(https?\:\/\/|)(youtu(\.be|be\.com)|vimeo).*+/, message: I18n.t('video.url_regex_validation')
  acts_as_taggable

  pg_search_scope :search_by_title, :against => :title

  before_save :update_video_info, :update_thumbnail_url

  def self.search(search)
    if search
      (search_by_title(search) + tagged_with(search)).uniq
    else
      none
    end
  end

  protected
  def update_video_info
    self.embed_url = video_info.embed_url
  end

  def update_thumbnail_url
    self.thumbnail_url = video_info.thumbnail_medium
  end

  def video_info
    @video_info ||= VideoInfo.new(url)
  end
end
