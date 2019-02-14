# == Schema Information
#
# Table name: clients_custom_lists
#
#  id             :bigint(8)        not null, primary key
#  custom_list_id :integer
#  client_id      :integer
#  active         :boolean          default(TRUE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe ClientsCustomList, type: :model do
  subject(:clients_custom_list) { described_class.new }

  describe 'associations' do
    it { is_expected.to belong_to(:custom_list) }
    it { is_expected.to belong_to(:client) }
  end
end
