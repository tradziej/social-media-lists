550.times do
  FederalLegislator.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    facebook_id: Faker::Number.number(12),
    twitter_username: Faker::Internet.username
  )
end

1000.times do
  Client.create(name: Faker::Company.name)
end