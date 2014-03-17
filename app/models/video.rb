class Video < ActiveRecord::Base

  include Shared::Voteable

  validates :title, :url, presence: true
  validates_format_of :url, with: /(https?\:\/\/|)(youtu(\.be|be\.com)|vimeo).*+/, message: I18n.t('video.url_regex_validation')
  acts_as_taggable

  before_save :update_video_info

  protected
  def update_video_info
    video_info = VideoInfo.new(url)
    self.embed_url = video_info.embed_url
  end

end
