# == Schema Information
#
# Table name: posts
#
#  id                      :bigint(8)        not null, primary key
#  posted_at               :datetime
#  content                 :text
#  url                     :string
#  person_id               :integer
#  social_media_account_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:person) }
    it { is_expected.to belong_to(:social_media_account) }
  end
end
