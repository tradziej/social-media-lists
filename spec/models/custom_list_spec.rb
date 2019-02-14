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
