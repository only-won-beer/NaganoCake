class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end


  def show
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all
  end


  def edit
  end



  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :price, :is_active, :description)
  end

end
