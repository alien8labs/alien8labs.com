Factory.define :user do |u|
  u.email { Factory.next(:email) }
  u.password "supersecret"
  u.password_confirmation "supersecret"
  u.association(:profile)
end
