class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update]

  def index
    @items = Item.all
  end

  def show
  end

  def update
    if @item.update(item_params)
      render :show
    end
  end

  private
    def set_item
      @item = Item.find_by_id(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price)
    end

end
