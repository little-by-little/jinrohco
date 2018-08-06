class VillageUser < ApplicationRecord
  belongs_to :user
  belongs_to :village
end
