Factory.define :profile do |p|
  p.first_name { Faker::Name.name }
  p.last_name { Faker::Name.name }
  p.user_id 1
end
