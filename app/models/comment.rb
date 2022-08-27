class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id
  validates :question, presence: true
  has_one :notification
end
