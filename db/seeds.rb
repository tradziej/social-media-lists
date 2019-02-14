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

custom_lists = [
  "Important industry figures",
  "List of state governors",
  "Members of a federal agency",
  "Custom list created by internal team",
  "Federal legislators"
]
custom_lists.each{ |name| CustomList.create(name: name) }

2000.times do
  Person.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end