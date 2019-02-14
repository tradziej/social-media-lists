# == Schema Information
#
# Table name: social_media_accounts
#
#  id         :bigint(8)        not null, primary key
#  kind       :string
#  username   :string
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SocialMediaAccount < ApplicationRecord
  SOCIAL_NETWORKS = %w(facebook twitter)

  belongs_to :person

  validates :kind, presence: true, uniqueness: { scope: :person_id }
  validates :kind, inclusion: { in: SOCIAL_NETWORKS }
  validates :username, presence: true
end
