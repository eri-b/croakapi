class Group < ApplicationRecord
  #include GroupHelper
  belongs_to :creator, class_name: 'User', optional: true
  validates :name, allow_blank: true, length: { in: 2..25 }
  validates :dm, inclusion: { in: [true, false] }
  has_many :group_members, dependent: :destroy
  has_many :users, through: :group_members
  has_many :messages
  serialize :dm_lookup, Array
  
  before_create :check_reverse_dm
  after_create :add_creator_to_group

  def admins
    group_members.where(admin: true)
  end

  def self.dm_exists?(u1, u2)
    #Group.exists?(dm_lookup: dm_look_up(u1, u2))
  end

  # arr of 2 user ids
  def self.find_dm(u1_id, u2_id)
    arr = [u1_id, u2_id].sort
    Group.find_by(dm_lookup: arr)
  end

  def self.find_dm2(u1_id, u2_id)
    a = DmMember.where(dm_member1_id: u1_id, dm_member2_id: u2_id).or(DmMember.where(dm_member1_id: u2_id, dm_member2_id: u1_id)).first
    return a.group unless a.nil?
  end

  private
  def check_reverse_dm
    # stop if this is a dupe
  end

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
