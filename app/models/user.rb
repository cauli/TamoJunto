class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :authorizations, dependent: :destroy
  validates :name, presence: true

  dragonfly_accessor :image

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session[:omniauth]
        user.email = auth.info.email if auth.info.email.present?
        user.name = auth.info.name
        user.remote_image_url = auth.info.image
        user.authorizations.build(provider: auth.provider, uid: auth.uid)
      end
    end
  end

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

  def soft_delete
    update_attribute(:active, false)
  end
end


