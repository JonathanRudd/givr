class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_dashboard
    @my_items = policy_scope(Item).where(user_id: current_user.id)
    authorize @my_items
    @my_pickups = policy_scope(Pickup).where(user_id: current_user.id)
    authorize @my_pickups
  end
end
