require 'rails_helper'

RSpec.describe ClientsCustomList, type: :model do
  subject(:clients_custom_list) { described_class.new }

  describe 'associations' do
    it { is_expected.to belong_to(:custom_list) }
    it { is_expected.to belong_to(:client) }
  end
end
