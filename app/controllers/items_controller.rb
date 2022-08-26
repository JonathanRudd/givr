class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = policy_scope(Item).includes(:user, :tags, images_attachments: :blob)
    @items = @items.search_by_title(params[:title]) if params[:title].present?
    @items = @items.search_by_address(params[:address]) if params[:address].present?
    @items = @items.tagged_with(params[:tag_list]) if params[:tag_list]&.second.present?
    # @items = @items.where("lower(title) LIKE ?", "%#{params[:title].downcase}%") if params[:title].present?
    # @items = @items.left_joins(:user).where("lower(address) LIKE ?", "%#{params[:address].downcase}%") if params[:address].present?
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
      image_url = ActionController::Base.helpers.cl_image_path(@item.images[0].key)
      results = ImaggaService.new.get_classes(image_url)

      @item.tag_list.add(results.first(5))
      # lets define a standard tag array and only pick out ones that match

      @item.save
      redirect_to @item, notice: 'New item registered'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      authorize @item
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to dashboard_path
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :title, :description, :timeframe, images: [], tag_list: [])
  end
end
