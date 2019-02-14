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

class ClientsCustomList < ApplicationRecord
  belongs_to :custom_list
  belongs_to :client
end
