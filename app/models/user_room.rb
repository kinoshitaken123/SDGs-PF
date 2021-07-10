class UserRoom < ApplicationRecord
  belongs_to :user, opitinal: ture
  belongs_to :room, opitinal: ture
end
