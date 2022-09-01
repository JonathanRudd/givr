class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id
  validates :question, presence: true
  
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    CommentNotification.with(comment: self, item: item).deliver_later(item.user)
  end

  def cleanup_notifications
    notifications_as_comment.each {|notif| notif.destroy}
  end
end
