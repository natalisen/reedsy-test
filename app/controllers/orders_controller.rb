class OrdersController < ApplicationController

  def show
    @order = Order.find_by_id(params[:id])
  end

  def create
    order = Order.new
    order.build_placements_with_item_ids_and_quantities(params[:order][:item_ids_and_quantities])
  
    if order.save
      redirect_to(order)
    else
      render json: { errors: order.errors }
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:total, :item_ids => [])
    end
end
