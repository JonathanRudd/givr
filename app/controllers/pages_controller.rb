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

    
  end


end
