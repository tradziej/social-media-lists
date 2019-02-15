FactoryBot.define do
  factory :person do
    first_name { "Joe" }
    last_name { "Doe" }
  end

  factory :social_media_account do
    person
    username { "xxx" }
  end

  factory :facebook_account, parent: :social_media_account do
    kind { "facebook" }
  end

  factory :twitter_account, parent: :social_media_account do
    kind { "twitter" }
  end

  factory :custom_list do
    name { "Custom list name" }
  end

  factory :post do
    person
    social_media_account
    url { "www." }
    content { "Post content" }
  end
end