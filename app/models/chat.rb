# == Schema Information
#
# Table name: chats
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chat < ApplicationRecord
end
