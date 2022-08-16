class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @items = policy_scope(Item)
    if params[:tag].present?
      @items = @items.tagged_with(params[:tag])
    end
  end

  def my_items
    @items = policy_scope(Item).where(user_id: current_user.id)
    authorize @items
  end

  def show
    @item = Item.find(params[:id])
    # @pickup = Pickup.new(user_id: current_user.id, item_id: @item.id)
    authorize @item
    @markers = [{
      lat: @item.user.latitude,
      lng: @item.user.longitude
    }]
    @recommendation_markers = [
      {
        lat: 35.6360,
        lng: 139.7079
      },
      {
        lat: 35.6270,
        lng: 139.7082
      },
    ]

    @all_markers = @markers + @recommendation_markers
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
    params.require(:item).permit(:user_id, :title, :description, :timeframe, images: [], tag_list: [])
  end
end
