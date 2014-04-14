module User::Authorizable
  extend ActiveSupport::Concern

  included do
    has_many :authorizations, dependent: :destroy

    def self.new_with_session(params, session)
      super.tap do |user|
        if auth = session[:omniauth]
          user.email = auth.info.email if auth.info.email.present?
          user.name = auth.info.name
          #user.remote_image_url = auth.info.image
          user.authorizations.build(provider: auth.provider, uid: auth.uid)
        end
      end
    end
  end
end
