require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  let(:person){ Person.create!(first_name: "John", last_name: "Kowalski") }
  let(:account){ SocialMediaAccount.create!(kind: "twitter", username: "a", person: person) }
  before(:each) do
    assign(:posts, Kaminari.paginate_array([
      Post.create!(
        content: "First",
        url: "www.",
        person: person,
        social_media_account: account
      ),
      Post.create!(
        content: "Second",
        url: "www.",
        person: person,
        social_media_account: account
      )
    ]).page(1))
  end

  it "displays all the posts" do
    render

    expect(rendered).to match /First/
    expect(rendered).to match /Second/
  end
end
