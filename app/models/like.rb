class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates_presence_of :product_id, :user_id
end
