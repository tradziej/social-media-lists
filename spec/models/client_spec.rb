require 'rails_helper'

RSpec.describe Client, type: :model do
  subject(:client) { described_class.new }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
