class Public::ItemsController < ApplicationController



  def show
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end




  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :price, :is_active, :description)
  end

end
