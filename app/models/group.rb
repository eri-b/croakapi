class Group < ApplicationRecord
  #include GroupHelper
  belongs_to :creator, class_name: 'User', optional: true
  validates :name, allow_blank: true, length: { in: 2..25 }
  validates :dm, inclusion: { in: [true, false] }
  validate :dupe_dm?
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :messages
  serialize :dm_lookup, Array

  after_create :add_first_members_to_group

  def admins
    group_members.where(admin: true)
  end

  def self.find_dm(u1_id, u2_id)
    arr = [u1_id, u2_id].sort
    Group.find_by(dm_lookup: arr)
  end

  private

  def dupe_dm?
    return unless dm # not a dm, no need to check

    if self.find_dm(dm_lookup.first, dm_lookup.second)
      errors.add(:dm_lookup, 'is a dupe')
    end
  end

  def add_first_members_to_group
    if dm
      # add both users to group
      users << User.find(dm_lookup.first)
      users << User.find(dm_lookup.second)
    else
      # add creator to group
      users << creator
      make_admin(creator)
    end

  end

  def make_admin(user)
    group_members.find_by(user: user).update(admin: true)
  end

end
