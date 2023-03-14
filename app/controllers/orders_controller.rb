class OrdersController < ApplicationController

  def index
  end

  def create
    @order = FurimaForm.new(order_params)
  end

  private
  def order_params
    params.permit(:item, :postcode, :shipping_area_id, :city, :city_number, :building_name, :phone_number, :purchase,)
end


