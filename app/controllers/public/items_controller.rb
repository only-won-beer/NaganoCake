class Public::ItemsController < ApplicationController
  layout 'public/application'

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    @review = Review.new
  end

  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    else
      @items = Item.all
    end
  end

end