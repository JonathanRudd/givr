class PickupsController < ApplicationController
  def index
    @pickups = policy_scope(Pickup).includes(:item)
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
      redirect_to dashboard_path(tab: "pickup"), notice: 'You have requested to pick up an item'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pickup = Pickup.find(params[:id])

    if @pickup.update(pickup_params)
      authorize @pickup
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @pickup = Pickup.find(params[:id])
    authorize @pickup
    @pickup.destroy
    redirect_to dashboard_path
  end

  private

  def pickup_params
    params.require(:pickup).permit(:item_id, :user_id, :note, :time, :date, :status)
  end
end
