class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :name, allow_blank: true, length: { in: 2..25 }
  has_many :group_members
  has_many :users, through: :group_members
  after_create :add_creator_to_group

  def admins
    group_members.where(admin: true)
  end

  private
    def add_creator_to_group
      self.users << self.creator
      self.make_admin(self.creator)
    end

    def make_admin(user)
      self.group_members.find_by(user: user).update(admin: true)
    end


end
