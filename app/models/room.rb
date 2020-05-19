class Room < ApplicationRecord
  # has_one :idUser1_id, :class_name => 'User'
  # has_one :idUser2_id, :class_name => 'User'
  has_many :room_messages, dependent: :destroy, inverse_of: :room
  
end
