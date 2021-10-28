class User < ApplicationRecord
  has_many :created_groups, foreign_key: "creator_id", class_name: "Group"
  has_many :group_members, dependant: :destroy
  has_many :groups, through: :group_members
  validates :phone_number, presence: true, uniqueness: true
  validates :username, allow_blank: true, length: { in: 3..25 }

end
