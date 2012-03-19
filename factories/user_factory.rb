Factory.define :user do |user|
  user.sequence(:email) { |n| "user#{n}@ticketee.com" }
  user.password "password"
  user.password_confirmation "password"
  user.admin false
  user.authentication_token "123"
end