class SocialMediaAccount < ApplicationRecord
  SOCIAL_NETWORKS = %w(facebook twitter)

  belongs_to :person

  validates :kind, presence: true, uniqueness: { scope: :person_id }
  validates :kind, inclusion: { in: SOCIAL_NETWORKS }
  validates :username, presence: true
end
