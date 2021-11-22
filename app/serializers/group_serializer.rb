class GroupSerializer
  attributes :name
  belongs_to :creator, record_type: :user
  has_many :messages
  has_many :users
end
