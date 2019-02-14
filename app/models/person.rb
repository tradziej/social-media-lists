class Person < ApplicationRecord
  has_and_belongs_to_many :custom_lists
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
