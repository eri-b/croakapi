class UserSerializer < ApplicationSerializer
  attributes :nickname, :phone_number, :status
  # has_one :status
  
end
