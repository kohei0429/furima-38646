class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  
  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase == nil
      @furima_form = FurimaForm.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @furima_form = FurimaForm.new(order_params)
    if @furima_form.valid?
      pay_item
      @furima_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:furima_form).permit(:postcode, :shipping_area_id, :city, :city_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end


