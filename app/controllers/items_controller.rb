class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :price, :item_description, :shipping_area_id, :item_status_id, :shipping_cost_burden_id, :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end
