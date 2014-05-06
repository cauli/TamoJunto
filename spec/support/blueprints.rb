require 'machinist/active_record'

User.blueprint do
  name                  { 'Some nice guy' }
  email                 { "someniceguy#{sn}@gmail.com" }
  password              { 'niceguy123' }
  password_confirmation { 'niceguy123' }
  gender                { 'M' }
  birthdate             { Date.today - 23.years }
end

Authorization.blueprint do
  user      { User.make! }
  provider  { "facebook" }
  uid       { 10000 }
end

Article.blueprint do
  user    { User.make! }
  title   { 'Some article' }
  content { 'Lorem Ipson' }
end

Organization.blueprint do
  name                  { 'Some nice organization' }
  email                 { "someniceorg#{sn}@gmail.com" }
  kind                  { 'individual' }
  password              { 'niceorg123' }
  password_confirmation { 'niceorg123' }
end

Video.blueprint do
  url         { 'http://www.youtube.com/watch?v=xRrL7Zgi8Rg' }
  title       { 'Some nice video' }
  description { 'Some nice description about the video' }
end

Document.blueprint do
  title       { 'Some nice document'}
  description { 'Some nice description to the document' }
  file        { File.open("#{Rails.root}/spec/fixtures/file.txt") }
end

Event.blueprint do
  organization { Organization.make! }
  name         { 'Some event' }
  description  { 'Awesome event' }
  local        { 'Hangouts' }
  starts_at    { Date.today }
  ends_at      { Date.today + 1.day }
  time         { 'All day' }
end

Service.blueprint do
  organization { Organization.make! }
  name { 'Some name' }
  description { 'Some description' }
  local { 'Some local' }
end

ActsAsTaggableOn::Tag.blueprint do
  name { 'test' }
end

Theme.blueprint do
  title { 'Nice title' }
  description { 'Some nice theme description' }
end

Topic.blueprint do
  title { 'Nice title' }
  description { 'Some nice topic description' }
end

Question.blueprint do
  question_text { 'Is this a nice question?' }
  good_answer { 'Yes' }
  bad_answer { 'No' }
  topic { Topic.make! }
  theme { Theme.make! }
  related_theme { Theme.make! }
end

Diagnostic.blueprint do
  user { User.make! }
end
