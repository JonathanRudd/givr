class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :question, presence: true
end
