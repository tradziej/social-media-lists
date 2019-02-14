# == Schema Information
#
# Table name: social_media_accounts
#
#  id         :bigint(8)        not null, primary key
#  kind       :string
#  username   :string
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
    it { is_expected.to have_many(:posts) }
  end
end
