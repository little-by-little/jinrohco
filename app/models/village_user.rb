# == Schema Information
#
# Table name: village_users
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  village_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VillageUser < ApplicationRecord
  belongs_to :user
  belongs_to :village
end
