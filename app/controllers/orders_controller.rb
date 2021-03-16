class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new
    if @item.history.present?
      redirect_to root_path
    end
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new(history_params)
    if @history_order.valid?
      pay_item
      @history_order.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def history_params
    params.require(:history_order).permit(:postal_code, :shipping_area_id, :city, :address_line, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

end
