550.times do
  FederalLegislator.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    facebook_id: Faker::Number.number(12),
    twitter_username: Faker::Internet.username
  )
end

100.times do
  Client.create(name: Faker::Company.name)
end

Client.find_each do |client|
  rand(0..3).times do
    client.custom_lists.create(name: Faker::Commerce.department)
  end
end

custom_lists = [
  "Important industry figures",
  "List of state governors",
  "Members of a federal agency",
  "Custom list created by internal team",
  "Federal legislators"
]
custom_lists.each{ |name| CustomList.create(name: name) }

def random_social_media
  [
    [],
    [SocialMediaAccount.new(
      kind: "facebook",
      username: Faker::Number.number(12)
    )],
    [SocialMediaAccount.new(
      kind: "twitter",
      username: Faker::Internet.username
    )],
    [
      [SocialMediaAccount.new(
      kind: "facebook",
      username: Faker::Number.number(12)
      )],
      [SocialMediaAccount.new(
      kind: "twitter",
      username: Faker::Internet.username
      )]
    ]
  ].sample
end

3000.times do
  person = Person.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
  person.custom_lists << CustomList.order("RANDOM()").first
  person.social_media_accounts << random_social_media
  person.save!
end

def url_for(account)
  case account.kind
  when "twitter"
    "https://twitter.com/#{account.username}/p/123"
  when "facebook"
    "https://facebook.com/#{account.username}/p/123"
  end
end

def time_rand(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
end

def random_posts_for(account)
  rand(0..5).times.map do
    Post.new(
      posted_at: time_rand(Time.local(2010, 1, 1)),
      url: url_for(account),
      content: Faker::Lorem.paragraph_by_chars(160, false),
      person: account.person
    )
  end
end

SocialMediaAccount.find_each do |account|
  account.posts << random_posts_for(account)
  account.save!
end