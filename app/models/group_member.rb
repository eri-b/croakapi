class GroupMember < ApplicationRecord
    belongs_to :group
    belongs_to :user

    after_destroy :clean_up

    private
        def clean_up
            if group.members.empty?
                group.destroy
            else
                if self.group.admins.empty?
                    # If there are no admins, set oldest member to admin
                    self.group.members.order(created_at: :asc).first.update(admin: true)
                end
            end
        end
end
