class NotificationsController < ApplicationController

    def update_seen_redirect
      @notification = Notification.find(params[:notification_id])
      authorize @notification
      @notification.update!(seen: true)
      redirect_to item_url(@notification.comment.item)
    end
end
