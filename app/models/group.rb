class Group < ApplicationRecord
  #include GroupHelper
  belongs_to :creator, class_name: 'User', optional: true
  validates :name, allow_blank: true, length: { in: 2..25 }
  validates :dm, presence: true
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :messages
  serialize :dm_lookup, Array
  
  after_create :add_creator_to_group

  def admins
    group_members.where(admin: true)
  end

  def self.dm_exists?(u1, u2)
    #Group.exists?(dm_lookup: dm_look_up(u1, u2))
  end

  # arr of 2 user ids
  def self.find_dm(u1, u2)
    arr = [u1, u2].sort
    Group.find_by(dm_lookup: arr)
  end

  def self.find_dm2(u1, u2)
    a = DmMember.where(dm_member1: u1, dm_member2: u2).or.where(dm_member1: u2, dm_member2: u1)
    return a.group if a.exists?
  end

  private

  # given two users does a DM exist
  def check_for_duplicate_dm
    if dm # comes from form
      # search in group_members for this combination

    end  
  end

  def add_creator_to_group
    # puts creator.username
    # users << creator
    # make_admin(creator)
  end

  def make_admin(user)
    group_members.find_by(user: user).update(admin: true)
  end

end
