# == Schema Information
#
# Table name: clients
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord
  has_many :clients_custom_lists
  has_many :custom_lists, through: :clients_custom_lists

  validates :name, presence: true
end
