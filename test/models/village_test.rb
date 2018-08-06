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

require 'test_helper'

class VillageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
