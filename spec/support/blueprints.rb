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
  content_html {'Lorem Ipson'}
end

Organization.blueprint do
  name {'Some nice organization'}
  email {"someniceorg#{sn}@gmail.com"}
  kind {'individual'}
  password {'niceorg123'}
  password_confirmation {'niceorg123'}
end

Video.blueprint do
  url {'http://www.youtube.com/watch?v=xRrL7Zgi8Rg'}
  title {'Some nice video'}
  description {'Some nice description about the video'}
end

Document.blueprint do
  title {'Some nice document'}
  description {'Some nice description to the document'}
  file {File.open("#{Rails.root}/spec/fixtures/file.txt")}
end

Event.blueprint do
  name        { 'Some event' }
  description { 'Awesome event' }
  local       { 'Hangouts' }
  starts_at   { Date.today }
  ends_at     { Date.today + 1.day }
  time        { 'All day' }
end
