# == Schema Information
#
# Table name: custom_lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CustomList, type: :model do
  subject(:custom_list) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:clients_custom_lists) }
    it { is_expected.to have_many(:clients) }
    it { is_expected.to have_and_belong_to_many(:people) }
  end
end
