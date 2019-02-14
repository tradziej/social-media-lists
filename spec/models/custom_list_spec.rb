require 'rails_helper'

RSpec.describe CustomList, type: :model do
  subject(:custom_list) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
