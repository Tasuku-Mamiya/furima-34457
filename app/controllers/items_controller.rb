class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_index_two, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :category_id, :price, :item_description, :shipping_area_id, :item_status_id, :shipping_cost_burden_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless  @item.user.id == current_user.id
  end

  def move_to_index_two
    redirect_to action: :index if @item.history.present?
  end

end
