# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
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
    @item = Item.find(params[:comment][:item_id])
    @pickup = Pickup.find(params[:comment][:id])
    @user = User.find(@pickup.user_id)
    "#{@user.nickname} commented on #{@item.title.truncate_words(10)}"
  end
  #
  def url
    item_path(Item.find(params[:comment][:item_id]))
  end
end
