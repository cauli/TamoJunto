if Rails.env.production?
  ActionMailer::Base.asset_host = 'tamojunto.com.br'
  Rails.application.routes.default_url_options = { host: 'tamojunto.com.br' }
else
  Rails.application.routes.default_url_options = { host: 'localhost:3000' }
end
