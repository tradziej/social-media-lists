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

require 'rails_helper'

RSpec.describe FederalLegislator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
