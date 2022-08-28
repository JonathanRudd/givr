class Pickup < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum time: { Before_8_AM: 0, Morning_8_to_12: 1, Afternoon_12_to_4: 2, Evening_4_to_8: 3, After_8_PM: 4 }
  # enum time: { Before8: 1, Morning: 1, Afternoon: 2, Evening: 3, After8: 4 }
  enum status: { pending: 0, accepted: 1, rejected: 2, cancelled: 3}
  has_many :messages, dependent: :destroy

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    PickupNotification.with(pickup: self, item: item).deliver_later(item.user)
  end

  def cleanup_notifications
    notifications_as_pickup.destroy.all
  end

end
