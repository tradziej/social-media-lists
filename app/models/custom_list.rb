class CustomList < ApplicationRecord
  has_many :clients_custom_lists
  has_many :clients, through: :clients_custom_lists
  has_and_belongs_to_many :people
  
  validates :name, presence: true
end
