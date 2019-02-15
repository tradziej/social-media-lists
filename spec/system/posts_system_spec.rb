require "rails_helper"

RSpec.describe "Posts filters", :type => :system do
  before do
    driven_by(:rack_test)
  end

  let(:person) { create(:person) }
  let(:facebook_account) { create(:facebook_account, person: person) }
  let(:twitter_account) { create(:twitter_account, person: person) }
  let!(:federal_legislators) { create(:custom_list, name: "Federal legislators") }
  let!(:list_by_team) { create(:custom_list, name: "List by team" )}
  let!(:posts) do
    [
      create(:post, social_media_account: facebook_account, person: person),
      create(:post, social_media_account: facebook_account, person: person),
      create(:post, social_media_account: twitter_account, person: person),
      create(:post, social_media_account: facebook_account, person: person),
      create(:post, social_media_account: twitter_account, person: person),
    ]
  end

  describe "custom lists filters" do
    it "allows to filter by custom lists" do
      visit "/"

      expect(page).to have_select("custom_lists")
    end

    it "filters by selected custom lists" do
      visit "/"

      expect(page).to have_selector("div[class=social-media-post]", count: posts.count)

      select("List by team", from: "custom_lists")
      click_button "Filter"

      expect(page).to_not have_selector("div[class=social-media-post]")
    end
  end

  describe "social media accounts filters" do
    it "allows to filter by social media accounts" do
      visit "/"

      expect(page).to have_select("social_accounts")
    end

    it "filters by social media accounts" do
      visit "/"

      expect(page).to have_selector("div[class=social-media-post]", count: posts.count)

      select("facebook", from: "social_accounts")
      click_button "Filter"

      expect(page).to_not have_selector("div[class=social-media-post]", count: 3)
    end
  end

  it "allows to filter by posted date" do
    visit "/"

    expect(page).to have_select("from_date_year")
    expect(page).to have_select("from_date_month")
    expect(page).to have_select("from_date_day")
    expect(page).to have_select("to_date_year")
    expect(page).to have_select("to_date_month")
    expect(page).to have_select("to_date_day")
  end
end