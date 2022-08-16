class PickupsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.find(params[:item_id])
    @pickup = Pickup.new(item_id: @item.id)
    authorize @pickup
  end

  def create
    @pickup = Pickup.new(pickup_params)
    @pickup.user = current_user
    @item = Item.find(params[:item_id])
    @pickup.item_id = @item.id
    authorize @pickup

    if @pickup.save
      redirect_to pickups_path
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

  def pickup_params
    params.require(:pickup).permit(:item_id, :user_id, :note, :status, :time, :date)
  end

end
