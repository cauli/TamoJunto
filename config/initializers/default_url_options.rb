if Rails.env.production?
  ActionMailer::Base.asset_host = 'tamojunto.org.br'
  Rails.application.routes.default_url_options = { host: 'tamojunto.org.br' }
else
  Rails.application.routes.default_url_options = { host: 'localhost:3000' }
end
