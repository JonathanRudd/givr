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
    @item = Item.new
    @item.user_id = current_user.id
    authorize @item
    if @item.save
      redirect_to '/items', notice: 'New item registered'
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
end
