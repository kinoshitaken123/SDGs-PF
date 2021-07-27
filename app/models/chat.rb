class Chat < ApplicationRecord
  belongs_to :user # opitinal: ture
  belongs_to :room

  # validates :message, presence: true
end
