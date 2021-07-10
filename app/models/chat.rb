class Chat < ApplicationRecord
  belongs_to :room, opitinal: ture　#optional: trueを設定することでnilを許可するように設定
  belongs_to :user, opitinal: ture
  belongs_to :room

  validates :chats, presence: true
end
