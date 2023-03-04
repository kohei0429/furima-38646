class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
