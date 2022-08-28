# To deliver this notification:
#
# PickupNotification.with(post: @post).deliver_later(current_user)
# PickupNotification.with(post: @post).deliver(current_user)

class PickupNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @item = Item.find(params[:pickup][:item_id])
    @pickup = Pickup.find(params[:pickup][:id])
    @user = User.find(@pickup.user_id)
    "#{@user.nickname} send you a pickup request for #{@item.title.truncate_words(10)}"
  end
  #
  # def url
  #   post_path(params[:post])
  # end
  def url
    dashboard_path(Item.find(params[:pickup][:item_id]))
  end
  
end
