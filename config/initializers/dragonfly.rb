require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "a1d88b9629c0fba7f906f19bd3baea2354a82a702459d7b5ab26451d742110d6"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
      bucket_name: ENV['aws_bucket'],
      access_key_id: ENV['aws_key'],
      secret_access_key: ENV['aws_secret'],
      region: ENV['aws_region']
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
