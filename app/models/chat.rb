# == Schema Information
#
# Table name: chats
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  village_id :integer
#

class Chat < ApplicationRecord
  belongs_to :village
  belongs_to :user
end
