# == Schema Information
#
# Table name: custom_lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CustomList < ApplicationRecord
  has_many :clients_custom_lists
  has_many :clients, through: :clients_custom_lists
  has_and_belongs_to_many :people
  
  validates :name, presence: true
end
