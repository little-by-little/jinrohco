# == Schema Information
#
# Table name: villages
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  mode       :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created_by :integer
#  villager   :integer          default(1), not null
#  wolf       :integer          default(1), not null
#  seer       :integer          default(0), not null
#  hunter     :integer          default(0), not null
#  madman     :integer          default(0), not null
#

class Village < ApplicationRecord
  has_many :village_users
  has_many :chats
  has_many :users, through: :village_users
end
