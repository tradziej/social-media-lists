# == Schema Information
#
# Table name: posts
#
#  id                      :bigint(8)        not null, primary key
#  posted_at               :datetime
#  content                 :text
#  url                     :string
#  person_id               :integer
#  social_media_account_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :person
  belongs_to :social_media_account

  validates :content, presence: true
  validates :url, presence: true
end
