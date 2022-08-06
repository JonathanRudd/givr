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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
