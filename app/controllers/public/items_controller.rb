class Public::ItemsController < ApplicationController
  layout 'public/application'



  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  def index
    @items = Item.all
  end

end