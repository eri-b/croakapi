class Message < ApplicationRecord
  belongs_to :group_member
  belongs_to :group

  validates :body, presence: true, length: { maximum: 255 }

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
