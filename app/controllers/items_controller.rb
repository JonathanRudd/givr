class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
  end

  def show
    @item = Item.find(params[:id])
    # @pickup = Pickup.new(user_id: current_user.id, item_id: @item.id)
    authorize @item
    @markers = [{
      lat: @item.user.latitude,
      lng: @item.user.longitude
    }]
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    authorize @item
    if @item.save
      redirect_to items_path, notice: 'New item registered'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :title, :description, :timeframe, images: [])
  end
end
