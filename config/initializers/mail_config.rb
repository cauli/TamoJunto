begin
  ActionMailer::Base.default 'Content-Transfer-Encoding' => 'quoted-printable'

  if Rails.env.production?
    ActionMailer::Base.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    port: '587',
    authentication: :plain,
    user_name: ENV['MANDRILL_USERNAME'],
    password: ENV['MANDRILL_APIKEY'],
    domain: 'www.tamojunto.org.br'
    }
    ActionMailer::Base.delivery_method = :smtp
  end
rescue
  nil
end
