require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to have_and_belong_to_many(:custom_lists) }
  end
end
