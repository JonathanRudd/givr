class Pickup < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum time: { AM: 0, PM: 1}
  enum status: { Pending: 0}
end
