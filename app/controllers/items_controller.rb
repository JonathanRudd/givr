class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = policy_scope(Item)
    if params[:title].present?
      @items = Item.search_by_title(params[:title])
    elsif params[:address].present?
      @items = Item.search_by_address(params[:address])
    elsif params[:tag_list]&.second.present?
      @items = Item.tagged_with(params[:tag_list])
    else
      @items = Item.all
    end
  end

  # def my_items
  #   @items = policy_scope(Item).where(user_id: current_user.id)
  #   authorize @items
  # end

  def show
    @item = Item.find(params[:id])
    # @pickup = Pickup.new(user_id: current_user.id, item_id: @item.id)
    authorize @item
    @markers = [{
      lat: @item.user.latitude,
      lng: @item.user.longitude,
      # info_window: render_to_string(partial: "info_window", locals: { item: item })
    }]
    # @recommendation_markers = [
    #   {
    #     lat: 35.6360,
    #     lng: 139.7079
    #   },
    #   {
    #     lat: 35.6270,
    #     lng: 139.7082
    #   },
    # ]

    # @all_markers = @markers + @recommendation_markers
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
      redirect_to dashboard_path, notice: 'New item registered'
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
