class Message < ApplicationRecord
  belongs_to :pickup
  belongs_to :user
  has_many :replies, foreign_key: :user_id, dependent: :destroy

  validates :content, presence: true
end
