class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :name, allow_blank: true, length: { in: 2..25 }
end
