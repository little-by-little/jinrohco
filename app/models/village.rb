class Village < ApplicationRecord
  has_many :users, through: :village_users
  has_many :village_users

  def host(user)
    self.created_by == user.id
  end
end
