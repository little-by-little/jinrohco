class Village < ApplicationRecord
  has_many :users, through: :village_users
  has_many :village_users
end
