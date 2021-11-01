class DmMember < ApplicationRecord
  belongs_to :dm_member1, class_name: 'User'
  belongs_to :dm_member2, class_name: 'User'
end
