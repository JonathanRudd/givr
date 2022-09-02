class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    pickup = Pickup.find(params[:pickup_id])
    message.user = current_user
    message.pickup = pickup
    authorize message
    if message.save
      redirect_to dashboard_path(tab: params[:message][:tab]),notice: 'Messages Replied'
    else
      redirect_to dashboard_path(tab: params[:message][:tab]), notice: 'Messages Reply Failed!!!!'
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
