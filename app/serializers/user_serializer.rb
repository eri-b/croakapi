class UserSerializer < ApplicationSerializer
  attributes :username, :phone_number, :status
  # has_many  :joined_groups
end
