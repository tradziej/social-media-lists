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
  has_many :posts
  has_many :social_media_accounts
  
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
