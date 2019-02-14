# == Schema Information
#
# Table name: people
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_and_belongs_to_many :custom_lists
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
