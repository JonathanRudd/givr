class MessagesController < ApplicationController
  def new
    @pickup = Pickup.find(params[:pickup_id])
    @message = @pickup.messages.new(user_id: params[:user_id])
  end
end
