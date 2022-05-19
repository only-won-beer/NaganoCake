class Public::ItemsController < ApplicationController
  layout 'public/application'



  def show
    @item = Item.find(params[:id])
  end


  def index
    @items = Item.all
  end

end
