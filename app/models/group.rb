class Group < ApplicationRecord
  include GroupHelper
  belongs_to :creator, class_name: 'User'
  validates :name, allow_blank: true, length: { in: 2..25 }
  validates :dm, presence: true
  has_many :group_members
  has_many :users, through: :group_members
  has_many :messages
  
  after_create :add_creator_to_group

  def admins
    group_members.where(admin: true)
  end

  def self.dm_exists?(u1, u2)
    Group.exists?(dm_lookup: dm_look_up(u1, u2))
  end

  private

  # given two users does a DM exist
  def check_for_duplicate_dm
    if dm # comes from form
      # search in group_members for this combination

    end  
  end

  def add_creator_to_group
    users << creator
    make_admin(creator)
  end

  def make_admin(user)
    group_members.find_by(user: user).update(admin: true)
  end

end
