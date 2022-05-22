class Admin::ItemsController < ApplicationController
  layout 'admin/application'

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to request.referer
    else
      render 'index'
    end
  end


  def show
    @item = Item.find(params[:id])
  end


  def index
    @item = Item.new
    @items = Item.all
    @genre = Genre.new
    @genres = Genre.all

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
