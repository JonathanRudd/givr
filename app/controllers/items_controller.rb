class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
  end

  def show
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
