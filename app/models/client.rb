class Client < ApplicationRecord
  has_many :clients_custom_lists
  has_many :custom_lists, through: :clients_custom_lists

  validates :name, presence: true
end
