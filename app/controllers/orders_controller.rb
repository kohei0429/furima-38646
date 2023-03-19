class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  
  def index
    @furima_form = FurimaForm.new
  end

  def create
    @furima_form = FurimaForm.new(order_params)
    if @furima_form.valid?
      @furima_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:furima_form).permit(:postcode, :shipping_area_id, :city, :city_number, :building_name, :phone_number, :purchase,).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end


