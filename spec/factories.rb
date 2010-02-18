Factory.define :post do |f|
  f.title 'title'
  f.body 'body'
end

Factory.define :user do |f|
  f.username 'foo'
  f.password 'secret'
  f.password_confirmation { |u| u.password }
  f.email 'foo@example.com'
end

Factory.define :invitation do |f|
  f.sequence(:recipient_email) { |n| "recipient#{n}@example.com"}
end

Factory.define :page do |f|
  f.permalink 'foo'
  f.body 'body'
end

