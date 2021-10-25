class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :user

  after_destroy :handle_member_leaving

  private

  def handle_member_leaving
    if group.users.empty?
      group.destroy
    else
      # If there are no admins, set oldest member to admin
      group.group_members.order(created_at: :asc).first.update(admin: true) if group.admins.empty?
    end
  end
end
