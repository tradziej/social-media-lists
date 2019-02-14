require 'rails_helper'

RSpec.describe SocialMediaAccount, type: :model do
  subject(:social_media_account) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_uniqueness_of(:kind).scoped_to(:person_id) }
    it {
      is_expected.to validate_inclusion_of(:kind)
        .in_array(%w(facebook twitter))
    }
    it { is_expected.to validate_presence_of(:username) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:person) }
  end
end
