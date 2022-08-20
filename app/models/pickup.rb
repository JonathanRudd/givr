class Pickup < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum time: { am: 0, pm: 1}
  enum status: { pending: 0, accepted: 1, rejected: 2}
  has_many :messages
end
