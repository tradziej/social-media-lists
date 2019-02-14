# == Schema Information
#
# Table name: clients
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  subject(:client) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:clients_custom_lists) }
    it { is_expected.to have_many(:custom_lists) }
  end
end
