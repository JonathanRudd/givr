class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_dashboard
    @my_items = policy_scope(Item).includes(:tags, pickup: :messages,  images_attachments: :blob).where(user_id: current_user.id)
    authorize @my_items
    @my_pickups = policy_scope(Pickup).includes(item: :tags).where(user_id: current_user.id)
    authorize @my_pickups
    @message = Message.new(user: current_user)
    mark_notifications_as_read if params[:from]=="notification"
    
  end

  private
  def mark_notifications_as_read
    if current_user
      # notifications_to_mark_as_read = @item.notifications_as_item.where(recipient: current_user)
      notifications = Notification.where(type: PickupNotification.name, recipient: current_user)
      notifications.update_all(read_at: Time.zone.now)
    end
  end


end
