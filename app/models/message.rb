class Message < ApplicationRecord
  belongs_to :pickup
  belongs_to :user
  validates :content, presence: true
end
