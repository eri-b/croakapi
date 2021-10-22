class User < ApplicationRecord
  has_many :groups, foreign_key: "creator_id"
  validates :phone_number, presence: true, uniqueness: true
  validates :username, allow_blank: true, length: { in: 3..25 }
end
