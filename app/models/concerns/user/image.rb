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
      _image = self.instance_of?(User) ? 'user-image.png' : 'org-image.png'
      return image.thumb(size).url if image.present?
      "http://gravatar.com/avatar/#{Digest::MD5.new.update(email)}.jpg?default=http://tamojunto.herokuapp.com#{ActionController::Base.helpers.image_path(_image)}&s=#{size}&"
    end
  end

end
