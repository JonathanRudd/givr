class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    # @pickup = Pickup.new(user_id: current_user.id, item_id: @item.id)
    authorize @item
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :timeframe)
  end
end
