# == Schema Information
#
# Table name: federal_legislators
#
#  id               :bigint(8)        not null, primary key
#  first_name       :string
#  last_name        :string
#  facebook_id      :string
#  twitter_username :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class FederalLegislator < ApplicationRecord
end
