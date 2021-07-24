class UserRoom < ApplicationRecord
  belongs_to :user, optional: true    #optional: trueを設定することでnilを許可するように設定
  belongs_to :admin, optional: true
  belongs_to :room
  
  
end
