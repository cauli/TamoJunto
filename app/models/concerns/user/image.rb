module User::Image
  extend ActiveSupport::Concern

  included do
    dragonfly_accessor :image

    def update_image(url)
      unless self.image.present?
        self.image_url = url if url.present?
        self.save!
      end
    end

    def avatar_url(size = '100x100#')
      return image.thumb(size).url if image.present?
      "http://gravatar.com/avatar/#{Digest::MD5.new.update(email)}.jpg?s=#{size}"
    end
  end

end
