require 'machinist/active_record'

# Add your blueprints here.

User.blueprint do
  name {'Some nice guy'}
  email {"someniceguy#{sn}@gmail.com"}
  password {'niceguy123'}
  password_confirmation {'niceguy123'}
end

Authorization.blueprint do
  user {User.make!}
  provider {"facebook"}
  uid {10000}
end

Article.blueprint do
  title {'Some article'}
  content {'Lorem Ipson'}
end

Organization.blueprint do
  name {'Some nice organization'}
  email {"someniceorg#{sn}@gmail.com"}
  kind {'individual'}
  password {'niceorg123'}
  password_confirmation {'niceorg123'}
end
